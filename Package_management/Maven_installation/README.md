#  **<span style="color:blue">United Core Systems, Worcester, Massachusetts.</span>**
### **<span style="color:blue">Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/></span>**
### **Email: info@unicoresystem.com**


## Apache Maven Installation And Setup In AWS EC2 Instance.
##### Prerequisite
+ AWS Acccount.
+ Create Security Group and open Required ports.
   + 22 ..etc
+ Create EC2 T2.micro Instance with 2GB of RAM.
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+


## AWS EC2 Instance
- Luanch an T2.micro server on you AWS console 


## 1. Install Java JDK 11+ and other prerequisite softwares (GIT, wget, tree and VIM)

``` sh
# install Java JDK 11+ as a pre-requisit for maven to run.
sudo hostnamectl set-hostname maven
cd /opt
sudo yum install wget vim tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
sudo su - ec2-user

# Verify git and Java JDK 11+ installation.
java -version
git --version
```

## 2. Download, extract and Install Maven
``` sh
# Download the Maven Software and remove zipped files
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.zip
sudo unzip apache-maven-3.9.4-bin.zip
sudo rm -rf apache-maven-3.9.4-bin.zip
sudo mv apache-maven-3.9.4/ maven
```
## 3. Set Environmental Variable  - For Specific User eg ec2-user
``` sh
# Open .bash_profile file a insect the script below # .bash_profile 
vi ~/.bash_profile  
export M2_HOME=/opt/maven
export PATH=$PATH:$M2_HOME/bin
```
## 4. Refresh the profile file and Verify if maven is running
```sh
source ~/.bash_profile
vim --version 
tree --version
git --version
java --version
mvn --version
```
