M9 DOCKER
-----------------------------------------------------------------
Docker provides this kind of system-level reproducibility by creating isolated programs dependencies.
Docker has three main concepts: docker file, docker image and docker container:
- Docker file: is a basic text document that contains all the commands a user could call on the command line to run an application. 
- Docker image: executable package of software that includes everything (application code, libraries, tools, dependencies etc.) necessary to make an application run
- Docker container: the same image can be launched multiple times, creating multiple containers.

Install Docker Desktop
On the computer terminal type:
$ docker run hello-world : runs a docker img, and a doc container is created
$ docker pull busybox: download an image
$ docker run busybox:  ask it to start the busybox virtual machine, do nothing and then close it again. 
$ docker run busybox echo "hello from busybox"
$ docker run -it busybox: iterative mode

$ docker images: shows a list of all imgs available
$ docker ps: shows a list of containers that are actually running
$ docker ps -a: shows a list of containers that have been run before. 
$ docker rm <container_id>: removes small remnants of the containers 

Trying to construct an docker file ourself: 
- one dockerfile for running our training script 
- one for doing predictions

Create a file called trainer.dockerfile and add ALL commands
$ docker build -f trainer.dockerfile . -t trainer:latest  # Building our docker file into a docker image

$ docker run --name experiment1 trainer:latest   # running the docker image
$ docker run -it --entrypoint sh {image_name}:{image_name}  # To start the image in interactive mode
# to copy the files between your container and laptop
$docker cp {container_name}:{dir_path}/{file_name} {local_dir_path}/{local_file_name}

M10 CONFIG FILES
-----------------------------------------------------------------
Hyperparameter: is any parameter that affects the learning process
# most basic ways of structuring hyperparameters, is just to put them directly into you train.py script:
class my_hp:
    batch_size: 64
    lr: 128
    other_hp: 12345

# easy access to them
dl = DataLoader(Dataset, batch_size=my_hp.batch_size)

# also in terminal
$ python train.py --batch_size 256 --learning_rate 1e-4 --other_hp 12345

Using Hydra:
pip install hydra-core --upgrade
