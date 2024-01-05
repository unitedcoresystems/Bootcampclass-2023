# HOw to Install MySQL on your EC2 DB Server 

1 — Install MySQL 

```
sudo yum update
sudo yum install mysql-server -y
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

