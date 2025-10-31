#!/bin/bash
set -e
sudo dnf update -y
sudo dnf install -y java-17-amazon-corretto java-17-amazon-corretto-devel
sudo tee /etc/yum.repos.d/jenkins.repo > /dev/null <<EOF
[jenkins]
name=Jenkins
baseurl=https://pkg.jenkins.io/redhat-stable/
gpgcheck=1
gpgkey=https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
enabled=1
EOF
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
