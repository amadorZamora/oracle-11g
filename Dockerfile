FROM centos:7
MAINTAINER amadorZamora

ADD assets /assets
ADD dbPackage /tmp/dbPackage

RUN chmod -R 755 /assets
RUN /assets/setup.sh

USER root
RUN echo "root:password" | chpasswd
RUN ssh-keygen -A
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 1521 8080 22

CMD ["/assets/entrypoint.sh"]
