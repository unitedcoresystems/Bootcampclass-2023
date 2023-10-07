#  **<span style="color:blue">United Core Systems, Worcester, Massachusetts.</span>**
### **<span style="color:blue">Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/></span>**
### **Email: info@unicoresystem.com**

## Jenkins Installation And Setup In AWS EC2 Ubuntu Instance.
##### Pre-requisite
+ AWS Acccount.
+ Create ubuntu EC2 t2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 8080 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for Jenkin version 

## AWS EC2 Instance
- Luanch an ubuntu T2.medium server and open port 8080 on you AWS console 

<img width="994" alt="Screenshot 2023-02-01 at 12 37 45 PM" src="https://user-images.githubusercontent.com/43399466/215974891-196abfe9-ace0-407b-abd2-adcffe218e3f.png">

### Install Java JDK 11+ and other softares (GIT, wget and tree)

``` sh
# install Java JDK 11+ as a pre-requisit for maven to run.
sudo hostnamectl set-hostname Jenkins
sudo apt update
sudo apt install openjdk-11-jre -y
sudo apt install wget vim tree unzip git-all -y
```
### Run the below commands to Verify Java and git is Installed

``` sh
java -version
git --version
```

### Run this commands to Install Jenkins

```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y 
```
###  Ensure that Jenkins is running and accesible on the browser
```sh
# Jenkins default port is = 8080
curl -v localhost:8080
```
### Start and Enable the Jenkins service to start at boot:
```sh
sudo systemctl enable jenkins
sudo systemctl start jenkins
```

### Login to Jenkins using the below URL:

http://public-ip-address:8080    
  
### After you login to Jenkins, 

- Run the command to copy the Jenkins Admin Password 
```sh
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
- Copy password and paste into Administrator password on jenkins URL
      
<img width="1291" alt="Screenshot 2023-02-01 at 10 56 25 AM" src="https://user-images.githubusercontent.com/43399466/215959008-3ebca431-1f14-4d81-9f12-6bb232bfbee3.png">

### Click on Install suggested plugins

<img width="1291" alt="Screenshot 2023-02-01 at 10 58 40 AM" src="https://user-images.githubusercontent.com/43399466/215959294-047eadef-7e64-4795-bd3b-b1efb0375988.png">

Wait for the Jenkins to Install suggested plugins

<img width="1291" alt="Screenshot 2023-02-01 at 10 59 31 AM" src="https://user-images.githubusercontent.com/43399466/215959398-344b5721-28ec-47a5-8908-b698e435608d.png">

Create First Admin User and add your email address

<img width="990" alt="Screenshot 2023-02-01 at 11 02 09 AM" src="https://user-images.githubusercontent.com/43399466/215959757-403246c8-e739-4103-9265-6bdab418013e.png">

Jenkins Installation is Successful. You can now starting using the Jenkins 

<img width="990" alt="Screenshot 2023-02-01 at 11 14 13 AM" src="https://user-images.githubusercontent.com/43399466/215961440-3f13f82b-61a2-4117-88bc-0da265a67fa7.png">

