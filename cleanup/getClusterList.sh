#!/bin/bash

tmc cluster list -o json -p capacity-test | jq ".clusters[].fullName.name" | sed 's/"//' | sed 's/"//' > clusters.txt