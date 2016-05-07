FROM centos:7.2.1511 
MAINTAINER corey@logicminds.biz
RUN echo "root:Docker!" | chpasswd
RUN mkdir -p /tmp/bootstrap
COPY scripts/rvm_setup.sh /tmp/bootstrap/rvm_setup.sh
COPY scripts/centos_7_x.sh /tmp/bootstrap/centos_7_x.sh
RUN bash /tmp/bootstrap/centos_7_x.sh
RUN bash /tmp/bootstrap/rvm_setup.sh
