#!/bin/sh
#
# run the playbook
ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook playbook.yml -i inventory --become-method sudo 
