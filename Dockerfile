## --- uncomment for control_node
#FROM williamyeh/ansible:ubuntu18.04-onbuild
#RUN apt update && apt -y install openssh-server net-tools iputils-ping vim
#RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa
#RUN mkdir /home/ansible
#WORKDIR /home/ansible
#COPY play /home/ansible
## --- uncomment host01 and host02
FROM sickp/centos-sshd:latest
RUN yum -y update && yum -y install sudo net-tools iputils vim
RUN useradd -ms /bin/bash centos && \
    echo "centos ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/centos && \
    chmod 0440 /etc/sudoers.d/centos
RUN sed -ri 's/PasswordAuthentication yes/#PasswordAuthentication yes/g' /etc/ssh/sshd_config
WORKDIR /home/centos
RUN mkdir .ssh && cd .ssh && touch authorized_keys && cd ../ && \
    chown centos:centos .ssh -R && \
    chmod 755 .ssh -R
