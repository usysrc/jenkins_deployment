#!/bin/sh
mkdir ansible
mkdir jenkins
cd ansible
ssh-keygen -f ./id_rsa -N ""
cd ../jenkins
ssh-keygen -f ./id_rsa -N ""
