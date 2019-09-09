# images for tensorflow models repo.
From tensorflow/tensorflow:1.13.2-gpu-py3

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y tzdata protobuf-compiler  python-pil python-lxml python-tk python-setuptools git 

RUN pip3 install Cython contextlib2  jupyter  matplotlib  numpy  lxml  pandas opencv-python absl-py 

RUN pip3 install "git+https://github.com/philferriere/cocoapi.git#egg=pycocotools&subdirectory=PythonAPI"

RUN apt-get install wget zip -y
RUN wget "https://github.com/google/protobuf/releases/download/v3.0.0/protoc-3.0.0-linux-x86_64.zip" && \
    unzip protoc-3.0.0-linux-x86_64.zip -d proto3 && \
    mv proto3/bin/* /usr/local/bin && \
    mv proto3/include/* /usr/local/include && \
    rm -rf proto3 protoc-3.0.0-linux-x86_64.zip    

# for jupyter notebook
RUN mkdir /.local && chown $(id -u) /.local -R 

RUN pip3 install pillow
WORKDIR /tensorflow