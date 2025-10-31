#!/bin/bash
set -e
sudo dnf update -y
sudo dnf install -y java-17-amazon-corretto java-17-amazon-corretto-devel
if ! id -u jenkins >/dev/null 2>&1; then
  sudo adduser jenkins
fi
sudo mkdir -p /home/jenkins/agent
sudo chown -R jenkins:jenkins /home/jenkins/agent
