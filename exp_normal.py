import os
import sys
if os.path.abspath('tusp-pddl-generator/src') not in sys.path:
    sys.path.append(os.path.abspath('tusp-pddl-generator/src'))
import json
import time
import subprocess

from generate import *
from create import *

from tqdm import tqdm

import matplotlib.pyplot as plt
import seaborn as sns

class ENHSPException(Exception):
    pass

def create_yard(ntrains: int, tlen: int, ntracks: int, ttlr: float, cmult: float, goal1: int, goal2: int):
    obj = YardCreator(ntrains, tlen, ntracks, ttlr, cmult, goal1, goal2)
    obj.create_layout()
    yard = ShuntingYard('test_yard', 'dom_n', DomainConfig.Numeric, DirectionStrategy.Aside,True,TrackOccupationStrategy.ORDER,0)
    yard.set_tracks(obj.get_track_init())
    yard.set_trains(obj.get_train_init())
    for train in yard.trains:
        train.goal = GoalStates.PARKING_AFTER_SERVICE
    yard.set_track_connections(obj.get_track_connections())
    yard.set_entry_track_connections(obj.get_entry_connections(), True)
    yard.set_servicing_tracks(obj.get_servicing_tracks())
    yard.generate_instance()
    yard.visualize(savefig=True)

def collect_runtime():
    start_time = time.time()
    result = subprocess.run(["java", "-jar", "ENHSP-Public/enhsp-dist/enhsp.jar",
                    "-sp", "output.plan", "-h", "hmrp", "-s",
                    "wa_star_4", "-red", "smart", "-gro", "naive",
                    "-o", "dom_n.pddl", "-f", "test_yard.pddl"], 
                    timeout=30,
                    stdout=subprocess.PIPE
                    )
    
    dt = time.time() - start_time  
    try:
        os.remove("output.plan")
    except:
        raise ENHSPException(f'{result.returncode}\n{result.stdout}\n{result.stderr}')
    return dt

def save_plot(runtimes: list, config: dict):
    sns.histplot(runtimes, binwidth=0.1)
    plt.xlabel('Runtime (s)')
    if config['goal1'] <= config['goal2']:
        title = 'Service & parking'
    else:
        title = 'Service, turn & parking'
    plt.suptitle(title, weight='bold').set_fontsize('18')
    subtitle = " ".join(f'{k}={config[k]}' for k in config.keys() if k not in ('goal1', 'goal2'))
    plt.title(subtitle).set_fontsize('12')
    plt.tight_layout()
    plt.savefig(subtitle.replace(' ','_').replace('=','') + ".png")


if __name__ == '__main__':
    
    with open("experiment_config.json", "r") as f:
        config = json.load(f)

    os.chdir("ENHSP-Public")
    subprocess.call("./compile")
    os.chdir("..")
    N_EXPERIMENTS = 10
    runtimes = []
    error_counter = 0
    for _ in tqdm(range(N_EXPERIMENTS)):
        try:
            create_yard(**config)
            dt = collect_runtime()
            runtimes.append(dt)
        except subprocess.TimeoutExpired:
            error_counter += 1
        except ENHSPException as e:
            print(str(e))
            error_counter += 1
    if error_counter > 0:
        print(f"Errors: {error_counter}/{N_EXPERIMENTS}")
    save_plot(runtimes, config)
    