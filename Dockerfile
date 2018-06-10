# Originally forked from: git@github.com:gasi/docker-node-hello.git

FROM arm64v8/ubuntu:16.04

LABEL "maintainer"="spino327@gmail.com"
LABEL "description"="Build of pytorch-0.4.0 for arm64v8."
LABEL "version"="0.4.0"

USER root

####################
# Installing dependencies
####################
RUN apt-get -y update

RUN apt-get -y install python3-pip python3-numpy swig python3-dev python3-yaml python3-setuptools 
RUN apt-get -y install libopenblas-dev cython libatlas-dev m4 libblas-dev libffi-dev
RUN pip3 install wheel setuptools typing pyyaml cffi
RUN pip3 install numpy==1.14.3  --upgrade

####################
# Installing build of pytorch
####################
ENV AP /tmp/pytorch_files
RUN mkdir -p $AP

# copying files
ADD ./files/torch-0.4.0a0+200fb22-cp35-cp35m-linux_aarch64.whl $AP/
WORKDIR $AP

RUN pip3 install torch-0.4.0a0+200fb22-cp35-cp35m-linux_aarch64.whl 

####################
# Entry point
####################
CMD [ "/bin/bash" ]

