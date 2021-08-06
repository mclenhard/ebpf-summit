## Getting Started with BCC on K8's - eBPF summit 2021
This repo represents a simple skeleton to get up and running with bcc on k8's

### Build the docker images
build the app image `docker build . -t repo/example-tool-name` 

build the init image `docker build -f init/Dockerfile  -t repo/bcc-linux-headers`

push your images ex: `docker push repo/example-tool-name`

#### Create the deployment 
If you are using your own container repo and images make sure to update the containers in the deployment file.

`kubectl apply -f deployment.yaml`


### questions or improvements 
email: matt@containiq.com 
