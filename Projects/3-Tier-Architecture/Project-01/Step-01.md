# Connect to your EC2 Instance 


## Step 1 – Preparing prerequisites
In order to complete this project you will need an AWS account and a virtual server with Ubuntu Server OS.

[AWS](https://aws.amazon.com/) is the biggest Cloud Service Provider and it offers a free tier account that we are going to leverage for our projects.

Right now, all we need to know is that Acloud Guru can provide us with a playground to to spin a free virtual server called EC2 (Elastic Compute Cloud) for our needs.

Spinning up a new EC2 instance (an instance of a virtual server) is only a matter of a few clicks.

You can either follow the following instruction

1. Launch a playground on Acloud Guru and setup AWS account to provision an Ubuntu Server
2. Connecting to your EC2 Instance

Or follow the instructions below.

1. Log into your AWS account and launch an EC2 instance.
2. Select your preferred region (the closest to you) and launch a new EC2 instance of t2.micro family with Ubuntu Server 20.04 LTS (HVM) and open port 80
3. Launch EC2 and Connect to your EC2 Instance with your private key pair

IMPORTANT – save your private key (.pem file) securely and do not share it with anyone! If you lose it, you will not be able to connect to your server ever again!


The process to connect to the virtual server is different between Windows and Mac. So lets take a quick tour.

## Step 2 - Connecting to EC2 terminal

## Using the terminal on MAC/Linux

- The terminal is already installed by default. You just need search for terminal to open it up.
- Change directory into the loacation where your PEM file is. Most likely will be in the Downloads folder

```
cd ~/Downloads
```

IMPORTANT - Anywhere you see these anchor tags < > , going forward, it means you will need to replace the content in there with values 
specific to your situation. For example, if we need you to replace the name you have saved the private key on your machine, we will 
write something like < private-key-name >.

If the private key you downloaded was named my-private-key.pem simply remove the anchor tags and insert my-private-key.pem in the
command you are required to execute. Lets try this and follow the instructions below to get some work done.

- Change premissions for the private key file (.pem), otherwise you can get an error "Bad permissions"

```
sudo chmod 400 <private-key-name>.pem
```


- Connect to the instance by running

```
ssh -i <private-key-name>.pem ubuntu@<Public-IP-address>
``` 
  
  
  
# Using Windows Terminal/putty/MobaXterm

Remember the private key your downloaded from AWS while provisioning the server? It is a PEM file format. You can open it up to see
the content and have a glimpse of what a PEM file looks like.

Now, we are going to use that PEM key to connect to our EC2 Instnace via ssh.

On, windows the windows terminal tool is not installed by default, you can install it from here

cd Downloads

IMPORTANT - Anywhere you see these anchor tags < > , going forward, it means you will need to replace the content in there with values
specific to your situation. For example, if we need you to replace the name you have saved the private key on your machine, we will 
write something like < private-key-name >.

If the private key you downloaded was named my-private-key.pem simply remove the anchor tags and insert my-private-key.pem in the 
command you are required to execute. Lets try this and follow the instructions below to get some work done.

Connect to the instance by 

```
ssh -i <private-key-name>.pem ubuntu@<Public-IP-address>
``` 
 
 
 Congratulations! You have just created your very first Linux Server in the Cloud and our set up looks like this now:
  (You are the client)



![projject1-step0](https://user-images.githubusercontent.com/85270361/210112007-5cd14a18-8aaa-4c7a-857e-b18400535bdd.PNG)


## IMPORTANT INFORMATION

Stop EC2

All we need to know right now is that we can use 750 hours (31.25 days) of t2.micro server per month for the first 12 months FOR FREE.

You can launch and stop new instances when you need to, but by default there is a soft-limit of maximum 5 running instances at the same time. In our first projects we will be using only 1 running instance at a time. When you stop an instance – it stops consuming available hours.

Note that every time you stop and start your EC2 instance – you will have a new IP address, it is normal behavior, so do not forget to update your SSH credentials when you try to connect to your EC2 server.

Let us move on and configure our EC2 machine to serve a Web server!