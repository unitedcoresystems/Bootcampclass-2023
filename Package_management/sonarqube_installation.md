#!/bin/bash
# Author: United Core System
# CentOs or REHEL 7/8

#As a good security practice, SonarQuber Server is not advised to run sonar service as a root user, 
#so create a new user called sonar and grant sudo access to manage sonar services as follows
# 1. create a sonar 
sudo useradd sonar
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
sudo hostnamectl set-hostname sonar-server

# 2. Enable PasswordAuthentication 
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart

# 3. Install JAVA pre-requisite
cd /opt
sudo yum -y install unzip wget git
sudo yum -y install java-11-openjdk-devel

# 4. Download the SonarqQube Server software. 
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8 sonarqube

# 5. Grand sudo access to sonar user
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/  

# 6. start sonarqube as sonar user using relative path
sudo su - sonar 
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start 
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status
#sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start | stop | status | restart

