# Kubernetes Setup Using Kubeadm In AWS EC2 Ubuntu Servers.

### Prerequisite
#### AWS Acccount.
- Create 3 - Ubuntu Servers -- 18.04.
- 1 Master (4GB RAM , 2 Core) t2.medium
- 2 Workers (1 GB, 1 Core) t2.micro
- Create Security Group and open required ports for kubernetes.
- Open all port for this illustration
- Attach Security Group to EC2 Instance/nodes.
- Assign hostname & login as ‘root’ user because the following set of commands need to be executed with ‘sudo’ permissions.


#### Copy this script and run in all master and worker nodes
[common.sh](./common.sh)

#### 1) Switch to root user [ sudo -i or sudo su - ] and run the following command to change the host name of the server
```sh
sudi -i
sudo hostnamectl set-hostname  node1
```
#### 2) Disable swap & add kernel settings
```sh
swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
```
#### 3) Add  kernel settings & Enable IP tables(CNI Prerequisites)
```sh
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sysctl --system
```
#### 4) Install containerd run time

##### To install containerd, first install its dependencies.
```sh
apt-get update -y
apt-get install ca-certificates curl gnupg lsb-release -y
```
##### Note: We are not installing Docker Here.Since containerd.io package is part of docker apt repositories hence we added docker repository & it's key to download and install containerd.

##### Add Docker’s official GPG key:
```sh
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
##### Use follwing command to set up the repository:
```sh
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
##### Install containerd
```sh
apt-get update -y
apt-get install containerd.io -y

# Generate default configuration file for containerd

# Note: Containerd uses a configuration file located in /etc/containerd/config.toml for specifying daemon level options.
# The default configuration can be generated via below command.

containerd config default > /etc/containerd/config.toml

# Run following command to update configure cgroup as systemd for contianerd.

sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

# Restart and enable containerd service

systemctl restart containerd
systemctl enable containerd
```
#### 5) Installing kubeadm, kubelet and kubectl

##### Update the apt package index and install packages needed to use the Kubernetes apt repository:
```sh
apt-get update
apt-get install -y apt-transport-https ca-certificates curl
```
##### Download the Google Cloud public signing key:
```sh
curl -fsSL https://dl.k8s.io/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
```
##### Add the Kubernetes apt repository:
```sh
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```
##### Update apt package index, install kubelet, kubeadm and kubectl, and pin their version:
```sh
apt-get update
apt-get install -y kubelet kubeadm kubectl
```
##### apt-mark hold will prevent the package from being automatically upgraded or removed.
```sh
apt-mark hold kubelet kubeadm kubectl
```
##### Enable and start kubelet service
```sh
systemctl daemon-reload
systemctl start kubelet
systemctl enable kubelet.service
```
Initialised the control plane in the master node as the root user.

##### Initialize Kubernetes control plane by running the below commond as root user.
```sh
sudo kubeadm init
exit as root user
sudo su - ubuntu
execute the below commands as a normal ubuntu user
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
```sh
#To verify, if kubectl is working or not, run the following command.
kubectl get pods -A
```
##### deploy the network plugin - weave network and verify
```sh
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
kubectl get pods -A
kubectl get node
```     
##### Generate the master join token on the master node
```sh
kubeadm token create --print-join-command
```
##### Copy the token and run it on worker nodes to add them to the control plane
```sh
# Replace the token below with yours. 
# This step is important when you restart your node
<!-- kubeadm join 172.31.10.12:6443 --token cdm6fo.dhbrxyleqe5suy6e \
        --discovery-token-ca-cert-hash sha256:1fc51686afd16c46102c018acb71ef9537c1226e331840e7d401630b96298e7d
        -->
```
