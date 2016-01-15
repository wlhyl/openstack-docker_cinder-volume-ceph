# 环境变量
- CINDER_DB: cinder数据库ip
- CINDER_DBPASS: cinder数据库密码
- RABBIT_HOST: rabbitmq IP
- RABBIT_USERID: rabbitmq user
- RABBIT_PASSWORD: rabbitmq user 的 password
- KEYSTONE_INTERNAL_ENDPOINT: keystone internal endpoint
- KEYSTONE_ADMIN_ENDPOINT: keystone admin endpoint
- CINDER_PASS: openstack cinder用户密码
- MY_IP: my_ip
- GLANCE_HOST: glance internal endpoint
- VOLUME_BACKEND_NAME: volume_backend_name
- SMBFS_SERVER: smbfs server ip address
- SMB_PASS: samba root 用户的密码

# volumes:
- /opt/openstack/cinder-volume-ceph: /etc/cinder
- /opt/openstack/log/cinder-volume-ceph:/var/log/cinder
- /etc/ceph:/etc/ceph

# 启动cinder-volume-ceph
```bash
docker run -d --name cinder-volume-ceph \
    -v /opt/openstack/cinder-volume-smbfs/:/etc/cinder \
    -e CINDER_DB=10.64.0.52 \
    -e CINDER_DBPASS=cinder_dbpass \
    -e RABBIT_HOST=10.64.0.52 \
    -e RABBIT_USERID=openstack \
    -e RABBIT_PASSWORD=openstack \
    -e KEYSTONE_INTERNAL_ENDPOINT=10.64.0.52 \
    -e KEYSTONE_ADMIN_ENDPOINT=10.64.0.52 \
    -e CINDER_PASS=cinder \
    -e MY_IP=10.64.0.52 \
    -e GLANCE_HOST=10.64.0.52 \
    -e VOLUME_BACKEND_NAME=one \
    -e NFS_SERVER=smbfs_server_ip \
    -e SMB_PASS=123456
    10.64.0.50:5000/lzh/cinder-volume-ceph:liberty
```