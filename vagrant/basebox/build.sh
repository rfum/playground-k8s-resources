#!/bin/bash

set -e

echo "checking virtualbox..."
if ! command -v virtualbox &> /dev/null
then
    echo "virtualbox not found. installing virtualbox..."
    wget -O- -q https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmour -o /usr/share/keyrings/oracle_vbox_2016.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle_vbox_2016.gpg] http://download.virtualbox.org/virtualbox/debian bookworm contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    sudo apt update
    sudo apt install virtualbox-7.0
fi
echo "virtualbox has been installed!"

vagrant plugin install vagrant-vbguest
vagrant up
vagrant package --output k8sbase.box
vagrant box add k8sbase k8sbase.box