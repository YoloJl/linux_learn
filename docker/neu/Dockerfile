FROM tensorflow/tensorflow:1.4.0-gpu-py3

COPY ./sources.list /etc/apt/sources.list
COPY ./pre_deal.sh /root

LABEL "tensorflow.version"="1.4.0" \
	  "keras.version"="2.1.5" \
	  "nvidia.cuda.version"="8.0" \
	  "nvidia.cudnn.version"="6.0"

#ENV PIPSOURCE=http://mirrors.aliyun.com/pypi/simple/
ENV PIPSOURCE=https://pypi.tuna.tsinghua.edu.cn/simple/ 

RUN rm /etc/apt/sources.list.d/* \
&& apt-get update \
&& apt-get install -y curl git vim \
build-essential python python-dev python-pip python3 python3-dev python3-pip python3-tk

#OpenCV
RUN apt-get install -y libopencv-dev python-opencv \
&& pip3 install -i $PIPSOURCE opencv-python

#Keras
RUN apt-get install -y graphviz \
&& pip3 install -i $PIPSOURCE h5py pydot keras==2.1.5
