# United Core Systems

### Contacts: 774-515-0044, 617-955-5115<br> WebSite : <http://unitedcoresystem.com/><br>Email: info@unicoresystem.com <br>Address: Worcester, (MA)

## Kubernetes Setup Using Kubeadm In AWS EC2 Ubuntu Servers.

### Prerequisite
#### AWS Account.
- Create 3 - Ubuntu Servers -- 18.04.
- 1 Master (4GB RAM, 2 Core) t2.medium
- 2 Workers (1 GB, 1 Core) t2.micro
- Create a Security Group and open required ports for Kubernetes.
- Open all ports for this illustration
- Attach Security Group to EC2 Instance/nodes.
- Assign hostname & login as ‘root’ user because the following set of commands needs to be executed with ‘sudo’ permissions.

#### 1) Steps Only For Kubernetes Master

####  copy and run this script in master and worker nodes
[master node for kubernetes ](./master-k8s.sh)
[worker nodes for kubernetes ](./worker-k8s.sh)

#### 2) Follow this step to setup Kubernetes Master

[How to setup kubernetes master ](./master-setup.md)

#### 3) Follow this steps to add the Worker Machines to Kubernates Master
=========================================

Copy kubeadm join token from and execute in Worker Nodes to join to cluster

**Example**
```sh
sudo kubeadm join 10.0.0.6:6443 --token xmzufh.e0nu3kb5ohijfxyh \
        --discovery-token-ca-cert-hash sha256:579b6a53bd00c8483f5150b9fb521b6431fc38b1ac716b8b9a5f668928a93771
```

#### 4) How to deploy Sample Application into Kubenetes cluster

**Deploy Nginx Application**

```sh
kubectl run nginx-demo --image=nginx --port=80 
kubectl expose pod nginx-demo --port=80 --target-port=80 --type=NodePort
```

**Get Node Port details**

```sh
kubectl get services
```





