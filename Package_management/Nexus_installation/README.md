#  **<span style="color:blue">United Core Systems, Worcester, Massachusetts.</span>**
### **<span style="color:blue">Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/></span>**
### **Email: info@unicoresystem.com**

## Nexus Installation And Setup In AWS EC2 Redhat Instance.
##### Pre-requisite
+ AWS Acccount.
+ Create Redhat EC2 t2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 8081 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for Nexus version 3.61.0-02

# Installation 

## 1. Set hostname, Add Nexus as a user and to the Sudors file.
sudo hostnamectl set-hostname nexus
sudo useradd nexus
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus

## 2. install Java JDK 11+ as a prerequisit for nexus to run.
sudo yum install wget nano tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y

## 3. Download, extract and Install Nexus
cd /opt
sudo wget http://download.sonatype.com/nexus/3/nexus-3.61.0-02-unix.tar.gz 
sudo tar -zxvf nexus-3.61.0-02-unix.tar.gz
sudo mv /opt/nexus-3.61.0-02 /opt/nexus
sudo rm -rf nexus-3.61.0-02-unix.tar.gz

## 4. Set set ownership permissions to nexus 
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work

## 5. change from #run_as_user="" to [ run_as_user="nexus" ]
echo  'run_as_user="nexus" ' > /opt/nexus/bin/nexus.rc

## 6. Create a softlink for nexus 
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

## 7. Enable and start the nexus services
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus

## 8. Ensure that nexus is running on port 8081 and Access nexus on the browser with public ip address with default Username ans Password

```sh
# verify nexus connection by running this command
curl -v localhost:8081

# Access nexus by entering server ip address with port number and default credentials
# publicIP:9000
# default USERNAME: admin
sudo cat /opt/sonatype-work/nexus3/admin.password   # nexus password 
```
