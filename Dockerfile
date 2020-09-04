
#### Use latest Ubuntu LTS release as the base
FROM ubuntu:bionic

# Update base container install
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y software-properties-common

# Install PIL dependencies
RUN apt-get update
RUN apt-get install -y python3-pip locales

# Ensure locales configured correctly
RUN locale-gen en_US.UTF-8
ENV LC_ALL='en_US.utf8'

# Set python aliases for python3
RUN echo 'alias python=python3' >> ~/.bashrc
RUN echo 'alias pip=pip3' >> ~/.bashrc

# This will install latest version of PIL
RUN pip3 install pillow awscli

COPY . /