#!/bin/bash

apt update -y
apt install sudo -y

# sudo adduser gabriel
sudo usermod -aG sudo gabriel
