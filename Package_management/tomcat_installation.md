#  **<span style="color:blue">United Core Systems, Worcester, Massachusetts.</span>**
### **<span style="color:blue">Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/></span>**
### **Email: info@unicoresystem.com**

## Apache Tomcat Installation And Setup In AWS EC2 Redhat Instance.
##### Prerequisite
+ AWS Acccount.
+ Create Redhat EC2 T2.micro Instance.
+ Create Security Group and open Tomcat ports or Required ports.
   + 8080 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+

# TOMCAT.SH
# Steps for Installing tomcat9 on rhel7&8
# install Java JDK 1.8+ as a pre-requisit for tomcat to run.
# Step 1 -- change hostname to tomcat
sudo hostnamectl set-hostname tomcat
# step 2 -- change directory to opt/
cd /opt 
# step 3 -- install prerequisit tools
sudo yum install git wget -y
sudo yum install java-1.8.0-openjdk-devel -y
# step 4 -- Download the latest version of tomcat software from https://tomcat.apache.org/download-90.cgi.
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz
# step 5 -- Extract tomcat
sudo tar -xvf apache-tomcat-9.0.80.tar.gz
# step 6 -- Remove Downloaded files
sudo rm apache-tomcat-9.0.80.tar.gz
# step 7 -- change extracted file name to tomcat9
sudo mv apache-tomcat-9.0.80 tomcat9
# step 8 -- change permission (give full permission to tomcat9)
sudo chmod 777 -R /opt/tomcat9
# step 9 -- start tomcat using the tomcat startup script
sudo sh /opt/tomcat9/bin/startup.sh
# step 10 -- create a soft link to start and stop tomcat from anywhere 
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
# step 11 -- start tomcat
sudo starttomcat
echo "end on tomcat installation"
#========