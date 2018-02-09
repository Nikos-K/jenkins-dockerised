This repo contains the Dockerfile and all files required to create a Docker image of a generic Jenkins instance.
In addition to **Jenkins v. 2.98**, the image contains the following:
* pip
* awscli v. 1.14.7
* jq
* Docker v. 17.09.1~ce-0~debian
* Docker Compose v. 1.17.1
* Jenkins Plugins:
..* scm-api:2.2.5
..* workflow-multibranch:2.16
..* run-condition:1.0
..* apache-httpcomponents-client-4-api:4.5.3-2.0
..* workflow-support:2.16
..* git-server:1.7
..* email-ext:2.61
..* windows-slaves:1.3.1
..* swarm:3.6
..* github:1.28.1
..* workflow-cps:2.42
..* command-launcher:1.1
..* ldap:1.18
..* workflow-basic-steps:2.6
..* pipeline-stage-step:2.3
..* token-macro:2.3
..* jquery-detached:1.2.1
..* ant:1.7
..* cloudbees-folder:6.2.1
..* pipeline-milestone-step:1.3.1
..* jackson2-api:2.8.7.0
..* pam-auth:1.3
..* build-pipeline-plugin:1.5.7.1
..* pipeline-model-definition:1.2.5
..* javadoc:1.4
..* script-security:1.38
..* credentials-binding:1.13
..* pipeline-model-extensions:1.2.5
..* pipeline-build-step:2.6
..* workflow-cps-global-lib:2.9
..* plain-credentials:1.4
..* jsch:0.1.54.1
..* ssh-credentials:1.13
..* jquery:1.12.4-0
..* workflow-api:2.24
..* ssh-slaves:1.22
..* github-branch-source:2.3.1
..* display-url-api:2.2.0
..* maven-plugin:3.0
..* conditional-buildstep:1.3.6
..* matrix-auth:2.2
..* github-api:1.90
..* mapdb-api:1.0.9.0
..* mask-passwords:2.10.1
..* ws-cleanup:0.34
..* pipeline-rest-api:2.9
..* mailer:1.20
..* git:3.6.4
..* job-dsl:1.66
..* handlebars:1.1.1
..* structs:1.10
..* pipeline-input-step:2.8
..* build-timeout:1.19
..* timestamper:1.8.8
..* workflow-aggregator:2.5
..* workflow-step-api:2.14
..* durable-task:1.17
..* matrix-project:1.12
..* branch-api:2.0.16
..* antisamy-markup-formatter:1.5
..* workflow-durable-task-step:2.17
..* ace-editor:1.1
..* bouncycastle-api:2.16.2
..* pipeline-model-api:1.2.5
..* pipeline-github-lib:1.0
..* gradle:1.28
..* external-monitor-job:1.7
..* credentials:2.1.16
..* pipeline-stage-view:2.9
..* momentjs:1.1.1
..* junit:1.23
..* resource-disposer:0.8
..* docker-commons:1.9
..* workflow-scm-step:2.6
..* pipeline-stage-tags-metadata:1.2.5
..* git-client:2.6.0
..* pipeline-model-declarative-agent:1.1.1
..* workflow-job:2.16
..* parameterized-trigger:2.35.2
..* authentication-tokens:1.3
..* docker-workflow:1.14
..* subversion:2.9
..* pipeline-graph-analysis:1.5
..* terraform:1.0.9


## Prerequisites

## To build the Jenkins Docker image
1. Clone the repo and navigate in the repository
2. Run `docker build -t jenkins .`

## To run a Jenkins Docker container using the new image:
1. Run the following command: `docker run -dt --name jenkins -p 80:8080 -e ADMIN_USER_NAME=<INSERT_USERNAME> -e ADMIN_USER_PASS=<INSERT_PASSWORD> -v /var/run/docker.sock:/var/run/docker.sock jenkins`
Note: Make sure you provide values for the ADMIN_USER_NAME & ADMIN_USER_PASS before executing the Docker run command.
