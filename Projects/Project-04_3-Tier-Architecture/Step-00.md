# Deploying Three-tier Architecture with Wordpress as application tier and MYSQL and NFS as a data tier 

## Step 1 – Setup your 3-Tier
## Step 2 - Install Apache HTTP and Download Wordpress
## Step 3 — Install MySQL on your DB Server EC2
## Step 4 — Install MySQL client on your EC2 Web Server 


# Setup your 3-Tier 

## 1. Launch another EC2 instances and name is "Web-Server". 

#### Prerequisite
+ Server Name: Web-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, and 80 
+ Storage: 10 gb

### Prepare a Web Server

-  Launch an EC2 instance that will serve as "Web Server" 
-  Install Apache HTTP web server 
-  Open port 22 and 80 

## 2. Launch another EC2 instances and name is "NFS-Server". 

#### Prerequisite
+ Server Name: NFS-Server
+ AMI:  RHEL 
+ Instance type:  T2.Medium 4GB of RAM.
+ Security Group: 22, and 80 
+ Storage: Volume xvdf 10 gb 
+ Storage: Volume xvdg 10 gb
+ Storage: Volume xvdh 10 gb


### Prepare the NFS Server

-  Launch a second RedHat EC2 instance that will have a role – ‘DB Server’
-  Install NFS Server 
-  Open port 3306 
-  Add two volumes of 10 gb

Use RedHat OS for this project

By now you should know how to spin up an EC2 instanse on AWS, but if you forgot – refer to Project-01 Step 1.
In previous projects we used ‘Ubuntu’, but it is better to be well-versed with various Linux distributions, thus, for this projects
we will use very popular distribution called ‘RedHat’ (it also has a fully compatible derivative – CentOS)

Note: for Ubuntu server, when connecting to it via SSH/Putty or any other tool, we used ubuntu user, but for RedHat you will need
to use ec2-user user. Connection string will look like ec2-user@<Public-IP>

Let us get started!