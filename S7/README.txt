M22 REQUESTS AND APIS
-----------------------------------------------------------------
We are going to do a couple of exercises on sending requests using requests package
to get familiar with the syntax.

$ pip install requests

import requests
response = requests.get('https://api.github.com/this-api-should-not-exist')
print(response.status_code)

response=requests.get("https://api.github.com/repos/SkafteNicki/dtu_mlops")

Creating APIs

$ pip install fastapi
$ pip install uvicorn[standard]

uvicorn --reload --port 8000 main:app

M23 LOCAL DEPLOYMENT
-----------------------------------------------------------------

PYTORCH:
we are going to focus on deployment of deep learning models, in particular Pytorch models which is used throughout the course

$ python inference.py --my_model model_checkpoint.pt --new_datapoint img.png

M24 CLOUD DEPLOYMENT
-----------------------------------------------------------------
Cloud functions are the easiest way to get started with deployment 
because they are what is called serverless. 

$ gcloud functions logs read
gsutil mb gs://<bucket-name>  # mb stands for make bucket
gsutil cp <file-name> gs://<bucket-name>  # cp stands for copy


Cloud RUN:
1. Start by going over the files belonging to your choice app and understand what it does.
2. Next build the docker image belonging to the app
	$ docker build -f <dockerfile> . -t gcp_test_app:latest

3. Next tag and push the image to your container registry
	$ docker tag gcp_test_app gcr.io/<project-id>/gcp_test_app
	$ docker push gcr.io/<project-id>/gcp_test_app



