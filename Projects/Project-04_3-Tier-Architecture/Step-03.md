# HOw to Install MySQL on your EC2 DB Server 

1 — Install MySQL 

```
sudo yum update
sudo yum install mysql-server
```

Verify that the service is up and running by using sudo systemctl status mysqld, if it is not running, restart the service and 
enable it so it will be running even after reboot:

```
sudo systemctl restart mysqld
sudo systemctl enable mysqld
```

2. Configure DB to work with WordPress

```
sudo mysql
CREATE DATABASE wordpress;
CREATE USER `myuser`@`<Web-Server-Private-IP-Address>` IDENTIFIED BY 'mypass';
GRANT ALL ON wordpress.* TO 'myuser'@'<Web-Server-Private-IP-Address>';
FLUSH PRIVILEGES;
SHOW DATABASES;
exit
```

3. Configure WordPress to connect to remote database.
Hint: Do not forget to open MySQL port 3306 on DB Server EC2. For extra security, you shall allow access to the DB server ONLY 
from your Web Server’s IP address, so in the Inbound Rule configuration specify source as /32

![5034](https://user-images.githubusercontent.com/85270361/210138507-0b3b6372-958b-406a-9672-82f729d26b85.PNG)


1. Install MySQL client and test that you can connect from your Web Server to your DB server by using mysql-client

```
sudo yum install mysql
sudo mysql -u admin -p -h <DB-Server-Private-IP-address>
```

2. Verify if you can successfully execute SHOW DATABASES; command and see a list of existing databases.

3. Change permissions and configuration so Apache could use WordPress:

4. Enable TCP port 80 in Inbound Rules configuration for your Web Server EC2 (enable from everywhere 0.0.0.0/0 or from your 
workstation’s IP)

5. Try to access from your browser the link to your WordPress 

http://<Web-Server-Public-IP-Address>/wordpress/
  
![5040](https://user-images.githubusercontent.com/85270361/210138663-27322aaf-f020-4261-a695-a98dc5f2387c.PNG)

  
Fill out your DB credentials:
  
![5050](https://user-images.githubusercontent.com/85270361/210138669-88078473-e459-4864-856f-4e6cb3d457d6.PNG)


If you see this message – it means your WordPress has successfully connected to your remote MySQL database
  
![5060](https://user-images.githubusercontent.com/85270361/210138718-d9c15bc9-f5b0-45f8-b613-11882374bf63.PNG)

