FROM centos:7

RUN yum update -y \
  && yum install -y sysvinit-tools iproute openssh-clients

ADD source /installer/MotionPro
RUN chmod +x /installer/MotionPro/MotionPro_Linux_CentOS_x64_v1.2.7_0608.sh \
  && /installer/MotionPro/MotionPro_Linux_CentOS_x64_v1.2.7_0608.sh

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/bin/bash"]
