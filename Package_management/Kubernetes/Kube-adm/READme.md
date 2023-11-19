# United Core Systems

### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

## Kubernetes Setup Using Kubeadm In AWS EC2 Ubuntu Servers.

### Prerequisite
#### AWS Acccount.
- Create 3 - Ubuntu Servers -- 18.04.
- 1 Master (4GB RAM , 2 Core) t2.medium
- 2 Workers (1 GB, 1 Core) t2.micro
- Create Security Group and open required ports for kubernetes.
- Open all port for this illustration
- Attach Security Group to EC2 Instance/nodes.
- Assign hostname & login as ‘root’ user because the following set of commands need to be executed with ‘sudo’ permissions.


#### Copy this script and run in master and worker nodes
[master node for kubernetes ](./master-k8s.sh)
[worker nodes for kubernetes ](./worker-k8s.sh)

#### 1) Steps Only For Kubernetes Master

**Switch to the root user.**
```sh
sudo su -
```

**Initialize Kubernates master by executing below commond.**
```sh
kubeadm init
```

**If you want to initialize kubernetes on Public EndPoint(Not recommended in real time). You can use below option Replace PUBLIC_IP with actual public ip of your kubernetes master node (Recommended to use Elastic(Create and assign elastic IP to master node and use that Elastic IP below)).Replace PORT with 6443 (API Server Port).**

```sh
kubeadm init --control-plane-endpoint "PUBLIC_IP:PORT"
```
```sh
# IF Error
sudo kubeadm init --cri-socket /run/containerd/containerd.sock
```

**Configure kubectl exit as root user & exeucte as normal ubuntu user**

```sh
exit
```

```sh
# run as a standard user 
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

**To verify, if kubectl is working or not, run the following command.**

```sh
kubectl get pods -o wide -n kube-system
```

**You will notice from the previous command, that all the pods are running except one: ‘core-dns’. For resolving this we will install a # pod network addon like Calico or Weavenet ..etc.** 


Note: Install any one network addon don't install both. Install either weave net or calico.

To install Weaven net run the following command.

```sh
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
```

Or To install the calico network addon, run the following command:

```sh
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml 
```

```sh
kubectl get nodes
kubectl get pods 
kubectl get pods --all-namespaces
```

**Get token**
```sh
kubeadm token create --print-join-command
```

## Adding Worker Machines to Kubernates Master
=========================================

Copy kubeadm join token from and execute in Worker Nodes to join to cluster


**Check Nodes**
```sh
# kubectl commonds has to be executed in master machine.
kubectl get nodes
```

**Deploy Sample Application**

```sh
kubectl run nginx-demo --image=nginx --port=80 
kubectl expose pod nginx-demo --port=80 --target-port=80 --type=NodePort
```

**Get Node Port details**

```sh
kubectl get services
```

## install Kubectl

install [kubectl.sh](./install-kubectl.sh)




