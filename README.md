This repo contains the Dockerfile and all files required to create a Docker image of a generic Jenkins instance.
In addition to **Jenkins v. 2.98**, the image contains the following:
* pip
* awscli v. 1.14.7
* jq
* Docker v. 17.09.1~ce-0~debian
* Docker Compose v. 1.17.1
* Jenkins Plugins: See list of plugins in [plugins.txt](plugins.txt).

## Prerequisites

## To build the Jenkins Docker image
1. Clone the repo and navigate in the jenkins-dockerised folder.
2. Run `docker build -t jenkins .`

## To run a Jenkins Docker container using the new image:
1. Run the following command: `docker run -dt --name jenkins -p 80:8080 -e ADMIN_USER_NAME=<INSERT_USERNAME> -e ADMIN_USER_PASS=<INSERT_PASSWORD> -v /var/run/docker.sock:/var/run/docker.sock jenkins`
Note: Make sure you provide values for the ADMIN_USER_NAME & ADMIN_USER_PASS before executing the Docker run command.
