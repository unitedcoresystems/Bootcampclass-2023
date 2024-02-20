# BEGIN ANSIBLE DEVELOPMENT

Step 1 .In your ansible-config-mgt GitHub repository, create a new branch that will be used for development of a new pipeline.

Tip: Give your branches descriptive and comprehensive names, for example, e.g pipeline

2. Checkout the newly created feature branch to your local machine and start building your code and directory structure
3. In your directory named playbooks create a directory called Tomcat – it will be used to store all your playbook files for tomcat installation.
4. Create a directory and name sonarqube and nexus  – it will be used to keep your installation files.
5. Within the playbooks folders, create your installation playbooks with each folder 
6. Within the inventory folder, create an inventory file (.yml) for dev environment.


Step 2 – Update Ansible Inventory
An Ansible inventory file defines the hosts and groups of hosts upon which commands, modules, and tasks in a playbook operate. 

Update below inventory structure in the inventory/dev file to start configuring your development pipeline servers. Ensure to replace the IP addresses according to your own setup.

Update your inventory/dev.yml file with this snippet of code:

```
[Tomcat]
<Tomcat-Server-Private-IP-Address> ansible_ssh_user='ec2-user'ansible_ssh_private_key_file=~/demoKey.pem

[Sonarqube]
<Sonarqube-Server-Private-IP-Address> ansible_ssh_user='ec2-user' ansible_ssh_private_key_file=~/demoKey.pem

[Nexus]
<Nexus-Private-IP-Address> ansible_ssh_user='ec2-user' ansible_ssh_private_key_file=~/demoKey.pem

```