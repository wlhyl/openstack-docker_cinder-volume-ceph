# image name lzh/cinder-volume-nfs:liberty
FROM 10.64.0.50:5000/lzh/openstackbase:liberty

MAINTAINER Zuhui Liu penguin_tux@live.com

ENV BASE_VERSION 2016-01-07
ENV OPENSTACK_VERSION liberty
ENV BUID_VERSION 2016-01-15

ADD ceph.repo /etc/yum.repos.d/ceph.repo

RUN yum update -y && \
         yum install -y openstack-cinder python-oslo-policy ceph && \
         rm -rf /var/cache/yum/*

RUN cp -rp /etc/cinder/ /cinder && \
         rm -rf /etc/cinder/* && \
         rm -rf /var/log/cinder/*

VOLUME ["/etc/cinder"]
VOLUME ["/var/log/cinder"]
VOLUME ["/etc/ceph"]

ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ADD cinder-volume-ceph.ini /etc/supervisord.d/cinder-volume-ceph.ini

ENTRYPOINT ["/usr/bin/entrypoint.sh"]