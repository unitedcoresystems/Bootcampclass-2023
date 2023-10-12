# United Core Systems
### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

# Nexus Installation And Setup In AWS EC2 Redhat Instance.
### Pre-requisite
+ AWS Acccount - Luanch an [ec2 instance](../EC2_Instances/README.md)
+ Create Redhat EC2 t2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 8081 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for Nexus version 3.61.0-02

# Installation 
```sh
## 1. Set hostname, Add Nexus as a user and to the Sudors file.
sudo hostnamectl set-hostname nexus
sudo useradd nexus
sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus
```
```sh
## 2. install Java JDK 11+ as a prerequisit for nexus to run.
sudo yum install wget nano tree unzip git-all -y
sudo yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
```
```sh
## 3. Download, extract and Install Nexus
cd /opt
sudo wget http://download.sonatype.com/nexus/3/nexus-3.61.0-02-unix.tar.gz 
sudo tar -zxvf nexus-3.61.0-02-unix.tar.gz
sudo mv /opt/nexus-3.61.0-02 /opt/nexus
sudo rm -rf nexus-3.61.0-02-unix.tar.gz
```
```sh
## 4. Set set ownership permissions to nexus 
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work
```
```sh
## 5. change from #run_as_user="" to [ run_as_user="nexus" ]
sudo echo  'run_as_user="nexus" ' > /opt/nexus/bin/nexus.rc
```
```sh
## 6. Create a softlink for nexus 
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
```
```sh
## 7. Enable and start the nexus services
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus
#NB: control C to exit from systemctl 
```
```sh
## 8. Ensure that nexus is running on port 8081 and Access nexus on the browser with public ip address with default Username ans Password
# verify nexus connection by running this command
curl -v localhost:8081
```
```sh
## 9. Access nexus by entering server ip address with port number and default credentials
### publicIP:8081
### default USERNAME: admin
### nexus password 
sudo cat /opt/sonatype-work/nexus3/admin.password   
```
# Configuration 

### Nexus - Maven Integration 

#### 1. Edit URL in POM.xml file
```sh
<distributionManagement>
	    <repository>
	      <id>nexus</id>
	      <name>United Core System Releases Nexus Repository</name>
	      <url>http://54.255.174.111:8081/repository/unitedcore/</url>
	    </repository>
	    
	    <snapshotRepository>
	      <id>nexus</id>
	      <name>United Core System Snapshot Nexus Repository </name>
	      <url>http://54.255.174.111:8081/repository/unitedcore/</url>
	    </snapshotRepository>    
</distributionManagement>
```

### Login to Nexus using you public ip of your server as shown below into URL of a web browers:
http://public-ip-address:8081    

### Copy password and paste into Administrator password on Nexus URL
      
<img width="1291" alt="Screenshot 2023-02-01 at 10 56 25 AM" src="https://user-images.githubusercontent.com/43399466/215959008-3ebca431-1f14-4d81-9f12-6bb232bfbee3.png">

### Click on Install suggested plugins

<img width="1291" alt="Screenshot 2023-02-01 at 10 58 40 AM" src="https://user-images.githubusercontent.com/43399466/215959294-047eadef-7e64-4795-bd3b-b1efb0375988.png">

### Wait for the Nexus to Install suggested plugins

<img width="1291" alt="Screenshot 2023-02-01 at 10 59 31 AM" src="https://user-images.githubusercontent.com/43399466/215959398-344b5721-28ec-47a5-8908-b698e435608d.png">

### Create First Admin User and add your email address

<img width="990" alt="Screenshot 2023-02-01 at 11 02 09 AM" src="https://user-images.githubusercontent.com/43399466/215959757-403246c8-e739-4103-9265-6bdab418013e.png">

### Nexus Installation is Successful. You can now starting using the Nexus 

<img width="990" alt="Screenshot 2023-02-01 at 11 14 13 AM" src="https://user-images.githubusercontent.com/43399466/215961440-3f13f82b-61a2-4117-88bc-0da265a67fa7.png">

