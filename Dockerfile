

#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:latest

# Install.
ENV DEBIAN_FRONTEND=noninteractive

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update \
 && apt-get install --yes \
    apt-transport-https \
    autoconf \
    automake \
    build-essential \
    cmake \
    curl \
    g++ \
    gcc \
    git \
    gpg \
    wget

# RUN \
#   apt-get update && \
#   apt-get -y upgrade && \
#   apt-get install -y build-essential && \
#   apt-get install -y software-properties-common && \
#   apt-get install -y make cmake byobu curl git htop man unzip vim wget && \
#   rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

RUN git clone --recurse-submodules https://github.com/Koihik/LuaFormatter.git /tmp/luaformatter \
&& cd /tmp/luaformatter \
&& mkdir build \
&& cd build  \
&& cmake .. -DBUILD_TESTS=FALSE \
&& cmake --build . --target install  \
&& rm -rf /tmp/luaformatter

# Define default command.
CMD ["bash"]
