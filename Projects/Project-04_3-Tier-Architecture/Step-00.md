# Deploying Three-tier Architecture with Wordpress as application tier and MYSQL and NFS as a data tier 

In this project you will implement a solution that consists of following components:

1. Infrastructure: AWS
2. Webserver Linux: Red Hat Enterprise Linux 8
3. Database Server: Ubuntu 20.04 + MySQL
4. Storage Server: Red Hat Enterprise Linux 8 + NFS Server
5. Programming Language: PHP
6. Code Repository: GitHub

# Setup your 3-Tier 

## 1. Launch three EC2 instances and name is "Web-Server-1 Web-Server-2 and Web-Server-3". 

#### Prerequisite
+ Server Name: Web-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, and 80 
+ Storage: 10 gb

### Preparing  Web Servers

-  Launch three EC2 instance that will serve as "Web Server" 
-  Install Apache HTTP , wordpress and php
-  Open port 22 and 80 

## 2. Launch an EC2 instances and name is "DB-Server". 

#### Prerequisite
+ Server Name: DB-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, and 80 
+ Storage: 10 gb 

### Prepare the DB Server

-  Launch a RedHat EC2 instance that will have a role – ‘DB Server’
-  Install mysql Server 
-  Open port 3306 

## 3. Launch another EC2 instances and name is "NFS-Server". 

#### Prerequisite
+ Server Name: NFS-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, and 80 
+ Storage: Volume xvdf 10 gb 
+ Storage: Volume xvdg 10 gb
+ Storage: Volume xvdh 10 gb

### Prepare the NFS Server

-  Launch a RedHat EC2 instance that will have a role – ‘NFS Server’
-  Install NFS Server 
-  Open port 3306 
-  Add two volumes of 10 gb

Use RedHat OS for this project


Let us get started!

