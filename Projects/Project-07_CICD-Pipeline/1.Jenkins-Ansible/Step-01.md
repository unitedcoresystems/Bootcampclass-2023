# Step 1: How to Install Jenkins and Ansible

### Install Jenkins

1. **Update the system packages**:
    ```bash
    sudo apt update
    ```

2. **Install Java Development Kit (JDK)**:
    ```bash
    sudo apt install openjdk-11-jdk -y
    ```

3. **Add the Jenkins repository and install Jenkins**:
    ```bash
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt update
    sudo apt install jenkins -y
    ```

4. **Start the Jenkins service**:
    ```bash
    sudo systemctl start jenkins
    ```

5. **Enable Jenkins to start on boot**:
    ```bash
    sudo systemctl enable jenkins
    ```

### Install Ansible

1. **Install software properties common package**:
    ```bash
    sudo apt install software-properties-common -y
    ```

2. **Add Ansible's official PPA (Personal Package Archive)**:
    ```bash
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    ```

3. **Install Ansible**:
    ```bash
    sudo apt install ansible -y
    ```

4. **Check the installation** by retrieving the Ansible version:
    ```bash
    ansible --version
    ```

Once you have installed Jenkins and Ansible, you can start configuring both tools to work together. Jenkins can trigger Ansible playbooks as part of a CI/CD pipeline, allowing you to automate the deployment and management of your application infrastructure.

Ensure that the user running Jenkins has the necessary permissions to execute Ansible commands and access the required servers and resources. You may also want to configure SSH keys for passwordless authentication to remote servers managed by Ansible.