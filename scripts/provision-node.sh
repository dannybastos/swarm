echo "================================"
echo "install docker..."
echo "================================"
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2 wget git

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce-selinux-17.03.3.ce-1.el7 containerd.io
systemctl enable docker.service
systemctl start docker.service

# mkdir -p /etc/docker
# cat <<EOF >/etc/docker/daemon.json
# {
#     "dns":["8.8.8.8","8.8.4.4"]
# }
# EOF

#groupadd docker
usermod -aG docker vagrant #$USER

#docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#systemctl restart docker

echo "================================"
echo "node done!"
echo "================================"
