
```
tmc cluster list -o json | jq ".clusters[].fullName.name"

```

```
tmc clustergroup list -o json | jq ".clusterGroups[].fullName.name"
```


```
tmc workspace list -o json | jq ".workspaces[].fullName.name"
```

tmc clustergroup list -o json | jq ".clusterGroups[].fullName.name | select (.clusterGroups[].meta.labels.class=bespin)"


```shell
tmc cluster list -o json -p capacity-test | jq ".clusters[].fullName.name" | sed 's/"//' | sed 's/"//' > clusters.txt
```