# Ansible101
CloudSeeders Workshop - To Join https://cloudseeders.org/

This demo is designed to demostrate Ansible basics.

It consists of the following files:

  - `Dockerfile` -  to build docker images for control and host nodes
  - `Makefile` -  for operations listed below
  - `play/myhosts` -  inventory file
  - `play/site.yml` - sample playbook
   

The Makefile can be used for the following operations:

  1. build docker image for control node - `make control` 
  2. build docker image for host node - `make host`
  3. spawn control and host nodes - `make spawn`
  4. list the running containers - `make list`
  5. exec into the control node - `make exec_control`
  6. exec into the host01 - `make exec_host01`
  7. exec into the host02 - `make exec_host02`
  8. delete the containers - `make clean`
  
After the setup is completed, 
  add ssh key from the control node `cat ~/.ssh/id_rsa.pub` to the host nodes `~centos/.ssh/authorized_keys` 
  to authorize the control node to ssh to the host nodes.

# Exercises:

  1. Test if the control node can ssh into the host nodes, 
                        `ansible all -i myhosts -m ping`
  2. Run the supplied playbook, 
                        `ansible-playbook -i myhosts site.yml`
  3. Run Ad-Hoc command to verify the package has been installed 
                        `ansible all -i myhosts -m command -a "rpm -q sysstat"`
  4. Change the playbook to ensure the package is removed, 
                        `sed -i -e 's/state: latest/state: absent/' -e 's/ensure.*/ensure sysstat is removed/' site.yml`
  5. Run the playbook again: 
                        `ansible-playbook -i myhosts site.yml`
  6. Verify the package has been removed, 
                        `ansible all -i myhosts -m command -a "rpm -q sysstat"`
