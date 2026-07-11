#!/bin/bash

set -e

apt-get update -y
apt-get upgrade -y

apt-get install -y \
    unzip \
    curl \
    wget \
    git \
    awscli

echo "User data executed successfully" > /home/ubuntu/userdata.log
