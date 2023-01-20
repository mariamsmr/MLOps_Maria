M15 UNITTESTING
-----------------------------------------------------------------
1. Build-in python debugger:
    import pdb
    pdb.set_trace() # trace directly by calling anywhere you want to stop the code

2. VS code: 
    - Insert inline breakpoints by pressing F9
    - Execute the script in debug mode 
    - Guide: https://code.visualstudio.com/docs/python/debugging#_basic-debugging


M16 GITHUB ACTIONS
-----------------------------------------------------------------
Using profilers can help you find bottlenecks in your code. 

$ pip install torch_tb_profiler  # profiler that is build into PyTorch already

M17 PRE-COMMIT
-----------------------------------------------------------------
Weights and Bias (wandb)

$ pip install wandb # install wandb on your laptop
$ wandb login # connect to your wandb account
manually close the connection using wandb.finish()

M18 CONTINUOUS CONTAINERS
-----------------------------------------------------------------


M19 CONTINUOUS ML
-----------------------------------------------------------------