FROM centos:7
MAINTAINER amadorzamora

ADD assets /assets
ADD dbPackage /tmp/dbPackage

RUN chmod -R 755 /assets
RUN chmod -R 755 /tmp/dbPackage

RUN /assets/setup.sh

USER root
RUN echo "root:password" | chpasswd
RUN yum -y install vim wget openssh unzip
RUN ssh-keygen -A
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 1521 8080 22

CMD ["/assets/entrypoint.sh"]
