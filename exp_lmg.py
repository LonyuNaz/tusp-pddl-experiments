import os
import sys
if os.path.abspath('tusp-pddl-generator') not in sys.path:
    sys.path.append(os.path.abspath('tusp-pddl-generator'))
import json
import time
import subprocess

from src.parser import *

from tqdm import tqdm

import pandas as pd
import networkx as nx
import numpy as np

class ENHSPException(Exception):
    pass

def create_yard(ntrains, ntracks, ncm, sg, pg, ptracks, stracks):
    gen = YardGenerator(
        ntrains,
        (80,),
        ntracks,
        (80,),
        int(ntracks*ncm),
        sg,
        sg+pg,
        stracks, 
        ptracks
    )

    yard = ShuntingYard(
        'test_yard',
        'dom_n',
        DomainConfig.Numeric,
        DirectionStrategy.Aside,
        True,
        TrackOccupationStrategy.ORDER,
        0
    )
    yard.load_generator(gen)
    yard.generate_instance()
    yard.draw_graph()
    yard.visualize(savefig=True)

    service_tracks = [t for t in yard.tracks if t.servicing]
    
    short_path_len =  []
    num_short_path = []
    all_path_len = []
    num_all_path = []
    for t in service_tracks:
        all_short_path = list(nx.all_shortest_paths(yard.graph, 'track_entry', t.name))
        all_sim_path = list(nx.all_simple_paths(yard.graph, 'track_entry', t.name))
        num_short_path.append(len(all_short_path))
        short_path_len.append(len(all_short_path[0]))
        num_all_path.append(len(all_sim_path))
        all_path_len.append(np.mean([len(x) for x in all_sim_path]))
    return yard, np.mean(short_path_len), np.mean(num_short_path), np.mean(all_path_len), np.mean(num_all_path)


def collect_enhsp_statistics():
    start_time = time.time()

    result = subprocess.run(["java", "-jar", "./ENHSP-Public/enhsp-dist/enhsp.jar",
                                            "-sp", "output.plan", "-h", "hadd", "-s",
                                            "wa_star_4", "-gro", "internal", "-ha", "true",
                                            "-o", "dom_n.pddl", "-f", "test_yard.pddl"], 
                                            timeout=30,
                                            stdout=subprocess.PIPE
                                            )
                            
    dt = time.time() - start_time  
    try:
        os.remove("output.plan")
    except:
        raise ENHSPException(f'{result.returncode}\n{result.stdout}\n{result.stderr}')

    output_lines = result.stdout.decode('utf8').split('\n')
    num_actions = 0
    for line in output_lines:
        if line.startswith('|A|'):
            num_actions = int(line.split(':')[1])

    return dt, num_actions

if __name__ == '__main__':

    with open('experiment_config.json', 'r') as f:
        exp_cfg = json.load(f)

    num_exp =  np.prod([len(exp_cfg[col]) for col in ('ntrains', 'ntracks', 'ncm', 'sgoal', 'pgoal', 'ptracks_m', 'reps')])

    os.chdir("ENHSP-Public")
    subprocess.call("./compile")
    os.chdir("..")


    results = {
        'ntrains':[],
        'ntracks':[],
        'nactions':[],
        'npath_short':[],
        'avgpath_short':[],
        'npath_simple':[],
        'avgpath_simple':[],
        'ncm':[],
        'steps':[],
        'config':[],
        'ptracks':[],
        'stracks':[],
        'runtime':[],
    }

    with tqdm(total=num_exp) as pbar:
        for ntrains in exp_cfg['ntrains']:
            for ntracks in exp_cfg['ntracks']:
                for ncm in exp_cfg['ncm']:
                    for sgoal in exp_cfg['sgoal']:
                        for pgoal in exp_cfg['pgoal']:
                            for ptracks_m in exp_cfg['ptracks_m']:
                                for stracks in exp_cfg['reps']:
                                    for _ in exp_cfg['reps']:
                                        ptracks = int(ntracks * ptracks_m)
                                        fails = 0
                                        while fails < 2:
                                            try:
                                                yard, spl, nsp, apl, nap = create_yard(ntrains, ntracks, ncm, sgoal, pgoal, ptracks, stracks)
                                                rt, nactions = collect_enhsp_statistics()
                                                break
                                            except Exception as e:
                                                fails +=1 
                                        pbar.update(1)
                                        if fails >= 2:
                                            continue
                                        results['ntrains'].append(ntrains)
                                        results['ntracks'].append(ntracks)
                                        results['nactions'].append(nactions)
                                        results['npath_short'].append(nsp)
                                        results['avgpath_short'].append(spl)
                                        results['npath_simple'].append(nap)
                                        results['avgpath_simple'].append(apl)
                                        results['ncm'].append(ncm)
                                        results['steps'].append(abs(sgoal) + abs(pgoal))
                                        results['config'].append(1+int(pgoal>0))
                                        results['ptracks'].append(ptracks_m)
                                        results['stracks'].append(stracks)
                                        results['runtime'].append(rt)
    df = pd.DataFrame(results)

    # df_old = pd.read_csv('results.csv')
    # df_new = pd.concat([df, df_old])

    df.to_csv('results.csv')

