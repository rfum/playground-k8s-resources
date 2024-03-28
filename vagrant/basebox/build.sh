#!/bin/bash
vagrant plugin install vagrant-vbguest
vagrant up
vagrant package --output k8sbase.box
vagrant box add k8sbase k8sbase.box