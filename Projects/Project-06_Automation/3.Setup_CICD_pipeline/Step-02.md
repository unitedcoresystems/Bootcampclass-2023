# Ansible and Tomcat Deployment

To accomplish the deployment of Tomcat using Ansible and then ensure its integration with an NFS server, follow these detailed steps:

### Preparing Your Ansible Environment

1. **Install Ansible** on your control machine if it's not already installed. On a Unix-like system, you can typically install Ansible via the package manager. For example, on Ubuntu:

   ```bash
   sudo apt update
   sudo apt install ansible
   ```

2. **Configure Ansible Inventory**: Edit the `/etc/ansible/hosts` file (or create a custom inventory file) and add your web servers under a group `[webservers]`:

   ```
   [webservers]
   server1.example.com
   server2.example.com
   ```

   Replace `server1.example.com` and `server2.example.com` with the actual hostnames or IP addresses of your servers.

### Step 1: Create an Ansible Playbook for Tomcat Installation

1. **Create a YAML file** (e.g., `install-tomcat.yml`) create your playbook to your and define the necessary tasks to install Tomcat. Click [here](install-tomcat.yml) to copy playbook to your playbook folder. 

### Step 2: Execute the Playbook on your jenkins-ansible server

- change directory to /var/lib/jenkins/jobs/ansible-config-mgt/builds/<build-number>/archive

  ```bash
 cd /var/lib/jenkins/jobs/ansible-config-mgt/builds/<build-number>/archive
  ```
  replace the <build-number> with your build number in jenkins 

- Run the playbook using the `ansible-playbook` command:

  ```bash
ansible-playbook -i Inventory/dev.yml Playbook/install-nexus.yml
  ```

### Step 3: Verify Tomcat Installation

- Confirm Tomcat is running by accessing `http://server_ip:8080` on your web browser, replacing `server_ip` with the actual IP address of one of your webservers.

### Step 4: Integrate with NFS for the `webapps` Directory

1. **Mount the NFS directory** on your webservers. First, ensure the NFS is on and running 

2. Create a mount point and mount the NFS share:

   ```bash
   sudo mkdir -p /mnt/nfs/webapps
   sudo mount nfs_server:/mnt/apps /mnt/nfs/webapps
   ```

   Replace `nfs_server` with the actual NFS server private ip address.

3. To ensure the mount persists across reboots, copy the follow onto your nptepad add replace the nfs_server with your private ip address and paste it to `/etc/fstab`:

    vi /etc/fstab 
   ```
   nfs_server:/mnt/apps /mnt/nfs/webapps nfs defaults 0 0
   ```
   Replace `nfs_server` with the actual NFS server private ip address.

4. **Symlink the Tomcat `webapps` directory** to the NFS-mounted directory:

   ```bash
   sudo ln -s /mnt/nfs/webapps /opt/tomcat/webapps
   ```

5. **Restart Tomcat** to apply the changes.

  ```bash
  sudo systemctl restart tomcat
  ```