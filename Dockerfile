FROM jenkins/jenkins:2.98

LABEL maintainer="Nikos-K"

USER root

# Install sudo
RUN apt-get update \
    && apt-get install -y sudo \
    && rm -rf /var/lib/apt/lists/* \
    && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# Install pip
RUN apt-get update && apt-get install -y python-pip

# Install aws cli
RUN pip install awscli==1.14.7

# Install jq
RUN apt-get install jq -y

# Set Docker versions
ARG DOCKER_VERSION=17.09.1~ce-0~debian
ARG DOCKER_COMPOSE_VERSION=1.17.1

# Install Docker
RUN apt-get update && \
    apt-get -y install apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce=${DOCKER_VERSION} && \
    usermod -aG docker jenkins

# Install Docker Compose
RUN curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Copy in configuration files
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/
COPY jobs/ /usr/share/jenkins/ref/jobs/
COPY javaposse.jobdsl.plugin.GlobalJobDslSecurityConfiguration.xml /usr/share/jenkins/ref/
COPY org.jenkinsci.plugins.terraform.TerraformBuildWrapper.xml /usr/share/jenkins/ref/
#COPY settings.xml /usr/share/jenkins/ref/.m2

RUN chown jenkins: $(find /usr/share/jenkins/ref -type f -name '*.groovy')

# Environment Variables
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

USER jenkins

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]