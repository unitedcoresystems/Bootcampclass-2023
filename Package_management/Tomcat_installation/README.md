# United Core Systems

### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

# Apache Tomcat Installation And Setup In AWS EC2 Redhat Instance.
#### Prerequisite
+ AWS Acccount.
+ Create Redhat EC2 with a minimum T2.micro Instance.
+ Create Security Group and open Tomcat ports or Required ports.
   + 22, 80, 443, 8080 ..etc
+ Attach Security Group to EC2 Instance.
+ Install pre-requisit java openJDK 1.8+, wget, unzip and git

# AWS EC2 Instance 
- Luanch an [ec2 instance](../EC2_Instances/README.md)

# Installation 
```sh
# Update Server and set timezone and hostname
sudo yum update
sudo hostnamectl set-hostname Maven
sudo timedatectl set-timezone America/New_York
``` 
```sh
# install Java JDK 11+ as a pre-requisit for maven to run.
sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install wget vim tree unzip git-all -y
```
```sh
# Run this commands to Install Maven
cd /opt 
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz
sudo tar -xvf apache-tomcat-9.0.80.tar.gz
sudo rm apache-tomcat-9.0.80.tar.gz
sudo mv apache-tomcat-9.0.80 tomcat9
```
```sh
# Ensure that Tomcat is running and accesible using this command
sudo chmod 777 -R /opt/tomcat9
sudo sh /opt/tomcat9/bin/startup.sh
```
```sh
### Create a soft link and start tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
sudo starttomcat
```
# Configurations 

### IP Configuration - How to allow internet access to tomcat server
```sh
## Run this command to open context.xml 
vi /opt/tomcat9/webapps/manager/META-INF/context.xml
```

```sh
# uncomment this section by removing '<!--' and '-->' then save context.xml file
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
```

### User Configuration - How to add Tomcat Admin usersname, password and roles
  
```sh
# Run this command to open tomcat-users.xml 
sudo vi /tomcat9/conf/tomcat-users.xml
```

```sh
# Edit and add this code, above the last closing tag `</tomcat-users>`
<user username="unitedcore" password="admin123" roles="manager-gui,admin-gui,manager-script"/>
<user username="isaac" password="admin123" roles="manager-gui,admin-gui,manager-script"/>
```


