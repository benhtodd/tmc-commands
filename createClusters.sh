#!/bin/bash
 
###
### Variables
###
 
### Hard coded variables ###
clusterNameBase="toddb-tmc-cluster"
clusterGroupName="toddb-cna-prod"
k8sVersion="v1.18.15+vmware.1-tkg.1.600e412"
clusterCount=3  #Set 'clusterCount' to number of clusters to build.
num=009  #Set 'num' to starting/first cluster number, include padded 0s.  eg: 00013
 
### Command line input options ###
read -p "How many clusters? " clusterCount
read -p "Starting cluster number? (include padded 0s, if necessary) " num
 
### Do not change these variables ###
max=$(((10#$num)+clusterCount-1))
 
 
###
### Script Body
###
 
set -e
 
### Make sure Tanzu Mission Control CLI is installed
type tmc > /dev/null 2>&1
if [ $? -eq 1 ]; then
        echo "It does not look like you have Tanzu Mission Control CLI installed. This script requires 'tmc' to automate Tanzu Mission Control functionality."
        exit 1
fi
 
### Loop to create group of TMC clusters
for clusterNum in $(seq -w $num $max)
do
        clusterName="$clusterNameBase-$clusterNum"
        tmc cluster create -t tkgs -n $clusterName -g $clusterGroupName --allowed-storage-classes vsphere-with-kubernetes --version $k8sVersion --storage-class vsphere-with-kubernetes --management-cluster-name livefire-cs-sv01 --provisioner-name observability --worker-instance-type best-effort-xlarge --instance-type best-effort-xlarge -q 1
        echo "$clusterName is provisioning..."
done
 
###
### Script End
###
