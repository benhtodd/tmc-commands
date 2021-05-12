# tmc-commands

To Create a Cluster

```
tmc cluster create -t tkgs -n <name>-01 -g <clusterGroupName> --allowed-storage-classes vsphere-with-kubernetes --version $k8sVersion --storage-class vsphere-with-kubernetes --management-cluster-name livefire-cs-sv01 --provisioner-name capacity-test --worker-instance-type best-effort-xlarge --instance-type best-effort-small -q 1
```

To Get the Cluster kubeconfig

```
tmc cluster auth kubeconfig get <yourname>-class-02 -m livefire-cs-sv01 -p observability > ~/Downloads/kubeconfig-<yourname>-class-02.yml

```