FROM ubuntu:15.04

RUN apt-get update -y
RUN apt-get install software-properties-common -y
RUN apt-get install -y git
RUN apt-get install -y vim
RUN apt-get install -y procps
RUN apt-get install -y curl
RUN apt-get install -y python
RUN add-apt-repository -y ppa:webupd8team/java
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs

RUN useradd -ms /bin/bash strong-pm
RUN chown -R strong-pm:strong-pm /usr/local

RUN apt-get install -y build-essential

#RUN su strong-pm -c "npm install -g strong-pm && npm cache clear"
#RUN su strong-pm -c "npm install -g strongloop && npm cache clear"
#RUN su strong-pm -c "npm install -g bower && npm cache clear"
RUN npm install -g strong-pm && npm cache clear
RUN npm install -g strongloop && npm cache clear

# Set up some semblance of an environment
WORKDIR /home/strong-pm
ENV HOME=/home/strong-pm

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Run as non-privileged user inside container
USER strong-pm

# Expose strong-pm port
EXPOSE 8701

ENTRYPOINT ["/usr/bin/sl-pm", "--base", ".", "--listen", "8701"]

