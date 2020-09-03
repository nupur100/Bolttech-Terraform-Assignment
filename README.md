# Kubernetes Cluster via Kops

### Launch the Amazon Linux EC2 instance and SSH to the server.

## Install kops: 

kops helps you create, destroy, upgrade, and maintain production-grade, highly available, Kubernetes clusters from the command line.

```
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/bin/kops
sudo echo "export PATH=$PATH:/usr/bin/kops"
```

## Install kubectl: 

Kubectl is a command-line tool from Kubernetes to deploy and manage applications on Kubernetes:

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/bin/kubectl
sudo echo "export PATH=$PATH:/usr/bin/kubectl"
```

## Set up Kops environment variables

```
sudo su
echo "export s3bucketname=nupur-kops-poc-s3"
echo "export KOPS_STATE_STORE=s3://$s3bucketname"
echo "export KOPS_CLUSTER_NAME=kubecluster.k8s.local"
echo "export awsregion=us-east-1"
echo "export clusterkey=test"
echo "export mastertype=t3.medium"
echo "export nodetype=t3.medium"
```

## IAM Role:

Create an IAM role with the below permissions and assign it to the instance from where you are executing the kops commands.

```
AmazonEC2FullAccess
AmazonRoute53FullAccess
AmazonS3FullAccess
IAMFullAccess
AmazonVPCFullAccess
```

## Create an S3 bucket to store the information related to Kubernetes:

```
aws s3api create-bucket --bucket $s3bucketname --region $awsregion
aws s3api put-bucket-versioning --bucket $s3bucketname --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket $s3bucketname  --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'
```

## Create a Cluster Config

```
sudo kops create cluster \
--cloud=aws \
--state=${KOPS_STATE_STORE} \
--node-count=1 \
--master-count=1 \
--master-size=${mastertype} \
--node-size=${nodetype} \
--zones=us-east-1a,us-east-1b,us-east-1e \
--name=${KOPS_CLUSTER_NAME} \
--networking=amazon-vpc-routed-eni \
--ssh-public-key=~/.ssh/${clusterkey}.pub
```

## Update the cluster

```
sudo kops update cluster --name ${KOPS_CLUSTER_NAME} --state ${KOPS_STATE_STORE} --yes
```

## Test the cluster

```
kubectl get nodes
```

**Hurray! Our Cluster is ready to use**

## To create a Kubernetes Cluster using Existing VPC components:

*Prerequisites:
Networking Components: VPC, Public and Private subnets, Route tables, Internet Gateway, Nat Gateway, Security Groups.*

## Add the below tags to the subnets:

```
Public Subnets: 
“kubernetes.io/cluster/kops-demo-cluster.k8s.local” = “shared” “kubernetes.io/role/elb” = “1” 
“SubnetType” = “Utility” 

Private Subnets:
“kubernetes.io/cluster/kops-demo-cluster.k8s.local” = “shared” “kubernetes.io/role/internal-elb” = “1” 
“SubnetType” = “Private”
```

## Create a Cluster Config:

```
sudo kops create cluster \
--cloud=aws \
--state=${KOPS_STATE_STORE} \
--node-count=1 \
--master-count=1 \
--master-size=${mastertype} \
--node-size=${nodetype} \
--zones=us-east-1a,us-east-1b,us-east-1e \
--name=${KOPS_CLUSTER_NAME} \
--vpc=${vpcid} \
--subnets=${pri_subnet1},${pri_subnet2},${pri_subnet3} \
--associate-public-ip=false \
--utility-subnets=${pub_subnet1},${pub_subnet2},${pub_subnet3} \
--topology=private \
--networking=amazon-vpc-routed-eni \
--network-cidr=${networkcidr} \
--api-loadbalancer-type=internal \
--ssh-public-key=~/.ssh/${clusterkey}.pub
```

## To Validate your cluster:

kops validate cluster --state=${KOPS_STATE_STORE}
