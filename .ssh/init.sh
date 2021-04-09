#!/bin/sh
mkdir ansible
mkdir jenkins
cd ansible
ssh-keygen -f ./id_rsa
cd ../jenkins
ssh-keygen -f ./id_rsa
