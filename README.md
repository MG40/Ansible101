# Ansible101
CloudSeeders Workshop

This demo is designed to demostrate Ansible basics.

The Makefile can be used for the following operations:

1. build docker image for control node - `make control` 
2. build docker image for host node - `make host`
3. spawn control and host nodes - `make spawn`
4. list the running containers - `make list`
5. exec into the control node - `make exec_control`
6. exec into the host01 - `make exec_host01`
7. exec into the host02 - `make exec_host02`
8. delete the containers - `make clean`
