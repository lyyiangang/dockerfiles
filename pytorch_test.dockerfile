# docker build -f ./pytorch_test.dockerfile -t bst/pytorch_v2 --build-arg USERID=$(id -u) .
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
RUN apt-get update -y && apt-get install -y software-properties-common
RUN add-apt-repository ppa:jonathonf/python-3.6 && apt-get update -y && \
    apt-get install -y build-essential && \
    apt-get install -y python3-pip vim wget python3.6 python3.6-dev \
    cmake git libgtk2.0-dev pkg-config libavcodec-dev \
    libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev \
    libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev libsm6 libxext6 libxrender-dev

RUN python3.6 -m pip  install torch torchvision opencv-python pandas numpy scipy pillow coloredlogs Cython

ARG USERID
RUN echo $USERID && alias ls="ls --color" && mkdir /.local && chown -R $USERID /.local

RUN python3.6 -m pip install tqdm h5py