# How to setup Master Node 

**Note** This Steps Is Only For Kubernetes Master

### 1. Switch to the root user.
```sh
sudo -i
```
### 2. Initialize Kubernates master by executing below commond.
```sh
kubeadm init
```

### 3. If you want to initialize kubernetes on Public EndPoint(Not recommended in real time). You can use below option Replace PUBLIC_IP with actual public ip of your kubernetes master node (Recommended to use Elastic(Create and assign elastic IP to master node and use that Elastic IP below)).Replace PORT with 6443 (API Server Port). 

kubeadm init --control-plane-endpoint "PUBLIC_IP:PORT"

IF Error
sudo kubeadm init --cri-socket /run/containerd/containerd.sock


### 4. Configure kubectl exit as root user & exeucte as normal ubuntu user
exit

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


# To verify, if kubectl is working or not, run the following command.

kubectl get pods -o wide -n kube-system

#You will notice from the previous command, that all the pods are running except one: ‘core-dns’. For resolving this we will install a # pod network addon like Calico or Weavenet ..etc. 


Note: Install any one network addon dont install both. Install either weave net or calico.

To install Weaven net run the following command.

kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

Or To install the calico network addon, run the following command:

kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml 


kubectl get nodes

kubectl get pods 
kubectl get pods --all-namespaces


# Get token

kubeadm token create --print-join-command

=========In Master Node End====================


Add Worker Machines to Kubernates Master
=========================================

Copy kubeadm join token from and execute in Worker Nodes to join to cluster



kubectl commonds has to be executed in master machine.

Check Nodes 
=============

kubectl get nodes


Deploy Sample Application
==========================

kubectl run nginx-demo --image=nginx --port=80 

kubectl expose pod nginx-demo --port=80 --target-port=80 --type=NodePort


Get Node Port details 
=====================
kubectl get services





