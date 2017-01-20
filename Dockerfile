#
# python3 Dockerfile
#
# https://github.com/ibbd/dockerfile-python/python3
#
# sudo docker build -t ibbd/python3 ./
#

# Pull base image.
FROM python:3.5-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# install 
# ipython: http://ipython.org/install.html
# TODO: 暂时只能使用tensorflow-0.11.0版本
RUN \
    pip install ipython \
    && pip install numpy \
    && pip install six \
    && pip install keras \
    && pip install prettytensor \
    && pip install pystan \
    && pip install pymc3 \
    && export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0-cp35-cp35m-linux_x86_64.whl \
    && pip install --upgrade $TF_BINARY_URL

# 代码目录
RUN mkdir -p /var/www

# Define working directory.
WORKDIR /var/www

# 解决时区问题
ENV TZ "Asia/Shanghai"
