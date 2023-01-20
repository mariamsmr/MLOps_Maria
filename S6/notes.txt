M20 CLOUD SETUP
-----------------------------------------------------------------

$ gcloud config set project <project-id>  # set the project that we just created
$ gcloud projects list  # get the project info by running

$gcloud components list #get a list of all install components using


M21 USING THE CLOUD
-----------------------------------------------------------------
VM allows you to essentially run an operating system that behaves like a completely separate computer. 
$ gcloud compute instances list # get list of instances created

$ gcloud beta compute ssh --zone <zone> <name> --project <project-id> #start a terminal directly

start (in the terminal) a new instance using a Pytorch image.
$ gcloud compute instances create <instance_name> \
  --zone=<zone> \
  --image-family=<image-family> \
  --image-project=deeplearning-platform-release \