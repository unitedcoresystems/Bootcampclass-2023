# United Core Systems

### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

## Apache Maven Installation And Setup In AWS EC2 Instance.
#### Prerequisite
+ AWS Acccount.
+ Create Security Group and open Required ports.
   + 22 ..etc
+ Create EC2 T2.micro Instance with 2GB of RAM.
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+


# AWS EC2 Instance 
- Luanch an [ec2 instance](../EC2_Instances/README.md)

# Installation 
``` sh
## 1. Install Java JDK 11+ and other prerequisite softwares (GIT, wget, tree and VIM)
sudo hostnamectl set-hostname maven
sudo yum install wget vim tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
sudo su - ec2-user
```

```sh
# Verify git and Java JDK 11+ installation.
java -version
git --version
```

``` sh
## 2. Download, extract and Install Maven
cd /opt
sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.zip
sudo unzip apache-maven-3.9.4-bin.zip
sudo rm -rf apache-maven-3.9.4-bin.zip
sudo mv apache-maven-3.9.4/ maven
```

``` sh
## 3. Set Environmental Variable  - For Specific User eg ec2-user
# Open .bash_profile file a insect the script below # .bash_profile 
vi ~/.bash_profile  
export M2_HOME=/opt/maven
export PATH=$PATH:$M2_HOME/bin
```

```sh
## 4. Refresh the profile file and Verify if maven is running
source ~/.bash_profile
mvn --version
```

# Configuration 

## 1. nexus - maven intergration 

#### Configure nexus login credentials in settings.xml file in the conf directory in the maven server  
sudo vi /opt/maven/settings.xml          

#### Edit and add credentials as shown below under server 
   <server>
      <id>nexus</id>
      <username>admin</username>
      <password>admin@123</password>
    </server>
```