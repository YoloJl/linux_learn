#!/bin/bash
tar -zxv -f cudnn-8.0-linux-x64-v6.0.tgz
cp cuda/include/cudnn.h /usr/local/cuda/include/
cp cuda/lib64/libcudnn* /usr/local/cuda/lib64/
cd /usr/local/cuda/lib64/
rm -rf libcudnn.so libcudnn.so.6
ln -s libcudnn.so.6.0.21 libcudnn.so.6
ln -s libcudnn.so.m libcudnn.so
