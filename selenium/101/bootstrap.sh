#!/usr/bin/env bash

set -e

apt-get update
apt-get install -y python3-pip

pip3 install --upgrade pip
pip install -r /vagrant/requirements.txt
