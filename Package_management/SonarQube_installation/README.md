## SonarQube Installation And Setup In AWS EC2 Redhat Instance.
##### Prerequisite
+ AWS Acccount.
+ Create Redhat EC2 T2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 9000 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for SonarQube version 7.8
+  As a good security practice, SonarQuber Server is not advised to run sonar service as a root user

# AWS EC2 Instance 
- Luanch an [ec2 instance](../EC2_Instances/README.md)

# Installation 

```sh
## 1. Create sonar user to manage the SonarQube server
sudo useradd Sonar
# Grand sudo access to sonar user
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
# set hostname for the sonarqube server
sudo hostnamectl set-hostname SonarQube-Server 
sudo su - Sonar
```
```sh
## 2. Enable PasswordAuthentication in the server
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
```
``` sh
## 3. Install Java JDK 1.8+ required for sonarqube to start
sudo yum -y install unzip wget git
sudo yum install  java-11-openjdk-devel -y
```
```sh
## 4. Download and extract the SonarqQube Server software.
cd /opt
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo rm -rf sonarqube-7.8.zip
sudo mv sonarqube-7.8 sonarqube
```
```sh
## 5. Grant file permissions for sonar user to start and manage sonarQube
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/
```
```sh
## 6. Start sonarQube server and create a soft link
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start 
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status
sudo ln /opt/sonarqube/bin/linux-x86-64/sonar.sh /etc/init.d/sonar
```

```sh
## 7. Ensure that SonarQube is running on port 9000 and Access sonarQube on the browser with public ip address with default Username ans Password
curl -v localhost:9000
# Access Sonarqube by entering server ip address with port number and default credentials
# publicIP:9000
# default USERNAME: admin
# default password: admin
```

```sh
## 8. Create sonarqube as a service
echo "[Unit]" > /etc/systemd/system/sonar.service
echo "Description=SonarQube service" >> /etc/systemd/system/sonar.service
echo "After=syslog.target network.target" >> /etc/systemd/system/sonar.service
echo "[Service]" >> /etc/systemd/system/sonar.service
echo "Type=forking" >> /etc/systemd/system/sonar.service
echo "ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start" >> /etc/systemd/system/sonar.service 
echo "ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop" >> /etc/systemd/system/sonar.service
echo "User=sonar" >> /etc/systemd/system/sonar.service
echo "Group=sonar" >> /etc/systemd/system/sonar.service
echo "Restart=always" >> /etc/systemd/system/sonar.service
echo "[Install]" >> /etc/systemd/system/sonar.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/sonar.service
```

```sh
## 9. Reload, enable and check sonar service 
sudo systemctl daemon-reload
sudo systemctl enable --now sonar
sudo systemctl status sonar
```

# Configuration

## Edit properties server IP Address and password to enable connection in POM.XML file

<properties>
		<jdk.version>1.8</jdk.version>
		<spring.version>5.1.2.RELEASE</spring.version>
		<junit.version>4.11</junit.version>
		<log4j.version>1.2.17</log4j.version>
		<sonar.host.url>http://18.138.81.149:9000/</sonar.host.url>
		<sonar.login>admin</sonar.login>
		<sonar.password>admin</sonar.password> 
		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
</properties>