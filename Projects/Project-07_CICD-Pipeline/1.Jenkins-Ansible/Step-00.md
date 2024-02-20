# Deploying Continous Integration (CI) pipeline with Jenkins Ansible Server 


## Prerequisites
Make sure that the following servers installation and configuration within this Project:

1. Two RHEL8 T2 micro Servers
2. One Ubuntu T2 meduim  (based on Ubuntu 20.04)
3. One RHEL8 T2 micro Webserver



In this project you will implement a solution that consists of following components:

1. Infrastructure: AWS
2. Webserver Server: Red Hat Enterprise Linux 8 + Tomcat
3. CI Server: Ubuntu 20.04 + Jenkins + Ansible
4. Quality gate Server: Red Hat Enterprise Linux 8 + Sonarqube
5. Artifact Server: Red Hat Enterprise Linux 8 + Nexus
6. Code Repository: GitHub


## 1. Launch an EC2 instances and name it "Sonarqube-Server"

#### Prerequisite - Quality Gate Server
+ Server Name: Sonaqube
+ AMI:  RHEL 
+ Instance type:  T2.Micro 1GB of RAM.
+ Security Group: 22, 9000, and 80 
+ Storage: 8 gb

### Preparation 

-  Launch an EC2 instance that will serve as "sonarqube Server" 
-  Open port 22, 900 and 80 

## 2. Launch an EC2 instances and name it "Nexus". 

#### Prerequisite - Artifact Server
+ Server Name: Nexus-Server
+ AMI:  RHEL 
+ Instance type:  T2.Micro 1GB of RAM.
+ Security Group: 22, 8081 and 80
+ Storage: 8 gb 

### Preparation  

-  Launch a RedHat EC2 instance that will have a role – ‘DB Server’
-  Open port 8081, 22, 80 

## 3. Launch another EC2 instances and name it "Jenkins-Ansible Server". 

#### Prerequisite
+ Server Name: Jenkins-Ansible Server
+ AMI:  Ubuntu 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: SSH 22, TCP 8080, 80 


### Prepare the Jenkins-Ansible Server

-  Launch a ubuntu EC2 instance – ‘Jenkins-Ansible Server’
-  Open the following ports SSH 22, TCP 8080, 80

## 4. Launch another EC2 instances and name it "Tomcat Server". 

#### Prerequisite
+ Server Name: Tomcat Server
+ AMI:  RHEL 
+ Instance type: T2.Micro 1GB of RAM.
+ Security Group: SSH 22, TCP 8080, 80 


### Prepare the Jenkins-Ansible Server

-  Launch a ubuntu EC2 instance – ‘Tomcat Server’
-  Open the following ports SSH 22, TCP 8080, 80
