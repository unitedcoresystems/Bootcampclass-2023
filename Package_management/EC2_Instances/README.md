# United Core Systems

### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

#  How to create a Red Hat EC2 instance on AWS, follow the steps below:

## **Sign in to the AWS Management Console**: 
   - Navigate to the EC2 dashboard.

## **Launch a new instance**:
   - Click on the “Instances” link in the left sidebar.
   - Click on the “Launch Instance” button.

## **Choose an Amazon Machine Image (AMI)**:
   - In the "Step 1: Enter the name of your server eg. Maven-Server
   - In the "Step 2: Select "Red Hat" in the quick start menu.
   - In the "Step 3: Choose a "Free tier eligible" Amazon Machine Image (AMI)" by selecting "Red Hat Enterprise Linux 9 (HVM) SSD Volume Type" or other free tier versions. 

## **Choose an Instance Type**:
   - In "Step 4: Choose an Instance Type", select the desired instance type based on your requirements (e.g., `t2.micro`, `t2.small`). 

## **Create a Key pair**:
   - In "Step 5: Click on "Create new key pair" or select on existing Key pair from dropdown buttom
   - In "Step 6: Enter Key pair name and click  "Create key pair" to create new key pair
   NB: Key pair will be automatically downloaded into your download folder

## **Network Settings:**:
   - In "Step 7: Add Storage", modify the storage settings as needed, then click "Next: Add Tags".

##  **Configure Security Group**:
   - In "Step 8: Configure Security Group", you can either create a new security group or select an existing one. 
   - In "Step 9: Add new rules to allow necessary traffic from required ports  (e.g., Type --> Custom TCP,  Port Range --> 8080, Source Type --> Anywhere). 

## **Review and Launch**:
   - Review the configurations and select the number of instance to launch. If everything looks good, click the "Launch" button.

## **Accessing the Instance**:
   - After a short while, your Red Hat EC2 instance will be up and running. Click on view all instances.  

## **Connecting via SSH**:
   - You can connect to your insatance using SSH and the key pair you downloaded. 
The default user for Red Hat instances is usually `ec2-user`.

## **Connection Instructions**:
   - Follow the instructions to connect to EC2 instance 

