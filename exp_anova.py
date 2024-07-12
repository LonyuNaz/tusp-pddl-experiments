import sys
import subprocess
import time
import scipy.stats
import numpy as np
import pandas as pd
from tqdm import tqdm




def do_3way_experiments(experiments: dict, reps: int, ntrains: int):
    assert len(list(experiments.keys())) == 3
    levels = [len(v) for v in experiments.values()]
    results = np.zeros((levels[0],levels[1],levels[2],reps))
    with tqdm(total=levels[0]*levels[1]*levels[2]*reps) as pbar:
        for a in range(levels[0]):
            for b in range(levels[1]):
                for c in range(levels[2]):
                    failures = 0
                    while failures < 5:
                        try:
                            obj = YardCreator(
                                num_trains=ntrains,
                                train_length=80,
                                num_tracks=list(experiments.values())[0][a],
                                train_track_length_ratio=list(experiments.values())[1][b],
                                goal1_steps=3,
                                goal2_steps=1,
                                conn_mult=list(experiments.values())[2][c]
                            )
                            obj.create_layout()
                            yard = ShuntingYard(
                                'test_yard', 
                                'dom_n', 
                                DomainConfig.Numeric,
                                DirectionStrategy.Aside,
                                True,
                                TrackOccupationStrategy.ORDER,
                                0
                            )
                            yard.set_tracks(obj.get_track_init())
                            yard.set_trains(obj.get_train_init())
                            for train in yard.trains:
                                train.goal = GoalStates.PARKING_AFTER_SERVICE
                            yard.set_track_connections(obj.get_track_connections())
                            yard.set_entry_track_connections(obj.get_entry_connections(), True)
                            yard.set_servicing_tracks(obj.get_servicing_tracks())
                            yard.generate_instance()
                            yard.visualize(savefig=True)
                            for r in range(reps):
                                start_time = time.time()
                                subprocess.call(["java", "-jar", "../enhsp-dist/enhsp.jar",
                                                "-sp", "output.plan", "-h", "hmrp", "-s",
                                                "wa_star_4", "-red", "smart", "-gro", "naive",
                                                "-o", "dom_n.pddl", "-f", "test_yard.pddl"], 
                                                timeout=30,
                                                stdout=subprocess.DEVNULL)
                                
                                results[a,b,c,r] = time.time() - start_time    
                                pbar.update(1)
                            break  
                        except:
                            failures += 1 
    return results

def ANOVA(experiments, results):
    reps = results.shape[-1]
    keys = list(experiments.keys())
    levels = [len(experiments[k]) for k in experiments.keys()]

    total_mean = np.mean(results)

    ssa = levels[1] * levels[2] * reps * np.sum([(np.mean(results[a,:,:,:]) - total_mean)**2 for a in range(levels[0])])
    ssb = levels[0] * levels[2] * reps * np.sum([(np.mean(results[:,b,:,:]) - total_mean)**2 for b in range(levels[1])])
    ssc = levels[0] * levels[1] * reps * np.sum([(np.mean(results[:,:,c,:]) - total_mean)**2 for c in range(levels[2])])

    ssab = levels[2] * reps * np.sum([[(np.mean(results[a,b,:,:]) - np.mean(results[a,:,:,:]) - np.mean(results[:,b,:,:])\
                               + total_mean)**2 for a in range(levels[0])] for b in range(levels[1])])
    ssac = levels[1] * reps * np.sum([[(np.mean(results[a,:,c,:]) - np.mean(results[a,:,:,:]) - np.mean(results[:,:,c,:])\
                               + total_mean)**2   for a in range(levels[0])] for c in range(levels[2])])
    ssbc = levels[0] * reps * np.sum([[(np.mean(results[:,b,c,:]) - np.mean(results[:,b,:,:]) - np.mean(results[:,:,c,:])\
                               + total_mean)**2   for b in range(levels[1])] for c in range(levels[2])])

    ssabc = reps * np.sum([[[(np.mean(results[a,b,c,:]) - np.mean(results[a,b,:,:]) - np.mean(results[:,b,c,:])\
                                - np.mean(results[a,:,c,:]) + np.mean(results[a,:,:,:]) + np.mean(results[:,b,:,:])\
                                + np.mean(results[:,:,c,:]) - total_mean)**2 for a in range(levels[0])]\
                                for b in range(levels[1])] for c in range(levels[2])])

    ssy = np.sum(results**2)
    ss0 = levels[0] * levels[1] * levels[2]* reps * total_mean**2
    sst = ssy - ss0
    sse = sst - ssa - ssb - ssab - ssac - ssbc - ssabc

    l = levels
    r = reps
    ss = np.array([ssa,      ssb,      ssc,      ssab,             ssac,             ssbc,             ssabc, sse])
    dof = np.array([(l[0]-1), (l[1]-1), (l[2]-1), (l[0]-1)*(l[1]-1), (l[0]-1)*(l[2]-1), (l[1]-1)*(l[2]-1),\
                    (l[0]-1)*(l[1]-1)*(l[2]-1), l[0]*l[1]*l[2]*(r-1)])

    ms = ss/dof
    f_comp = ms/ms[-1]

    f_table = [scipy.stats.f.ppf(q=1-.05, dfn=dof[i], dfd=dof[-1]) for i in range(len(dof)-1)] + [None]

    table = {
        'ss':ss,
        'dof':dof,
        'ms':ms,
        'F_comp':f_comp,
        'F_table':f_table
    }

    return pd.DataFrame(table, index=[keys[0], keys[1],keys[2], f'{keys[0]}*{keys[1]}',f'{keys[0]}*{keys[2]}',f'{keys[1]}*{keys[2]}',f'{keys[0]}*{keys[1]}*{keys[2]}','Error'])
