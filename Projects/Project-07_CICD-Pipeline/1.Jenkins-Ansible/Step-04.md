# BEGIN ANSIBLE DEVELOPMENT

Step 1 – Update Ansible Inventory
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

Step 2 .In your ci-pipeline-playbook GitHub repository.

Jenkins will do its job and save all the files (build artifacts) to /var/lib/jenkins/jobs/ci-pipeline/builds/build_number/archive/ directory on Jenkins-Ansible server.