
## 1. Install Java JDK 11+ and other prerequisite softwares (GIT, wget, tree and VIM)

``` sh
# install Java JDK 11+ as a pre-requisit for maven to run.
sudo hostnamectl set-hostname maven
sudo su - ec2-user
cd /opt
sudo apt-get install wget vim tree unzip git-all -y
sudo apt-get install java-11-openjdk-devel java-1.8.0-openjdk-devel -y

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
