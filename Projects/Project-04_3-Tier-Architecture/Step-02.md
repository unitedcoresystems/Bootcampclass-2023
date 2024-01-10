# How to Install MySQL and configure the database server 

1. Install MySQL on your database server 

- Install MySQL server
- Create a database and name it wordpress
- Create a database user and name it webaccess
- Grant permission to webaccess user on project4 database to do anything only from the webservers subnet cidr

1 — Install MySQL 

```
sudo apt update
sudo apt install mysql-server -y
```

Verify that the service is up and running by using sudo systemctl status mysqld, if it is not running, restart the service and 
enable it so it will be running even after reboot:

```
sudo systemctl restart mysql
sudo systemctl enable mysql
```

2. Create a database and database user and grant permission 

```
sudo mysql
```
Enter this command in mysql > 

```sql
CREATE DATABASE wordpress;
CREATE USER `webaccess`@`<Web-Server-private-ip>` IDENTIFIED BY 'web@123';
GRANT ALL ON wordpress.* TO 'webaccess'@'<Web-Server-private-ip>';
FLUSH PRIVILEGES;
SHOW DATABASES;

```sql
exit
```

3. You might need to configure MySQL server to allow connections from remote hosts.

```
sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf
```

Replace ‘127.0.0.1’ to ‘0.0.0.0’ like this:

![5018](https://user-images.githubusercontent.com/85270361/210136418-f4832b77-89d4-4e65-8287-6e73a338a65a.PNG)


4. From mysql client Linux Server connect remotely to mysql server Database Engine without using SSH. You must use the mysql utility to perform this action.

5. Check that you have successfully connected to a remote MySQL server and can perform SQL queries:

```
Show databases;
```

