#!/bin/bash


a=$(curl -XGET -u admin:admin http://localhost:7180/api/v44/hosts | jq '.items[0].hostId')
b=$(curl -XGET -u admin:admin http://localhost:7180/api/v44/hosts | jq '.items[1].hostId')
c=$(curl -XGET -u admin:admin http://localhost:7180/api/v44/hosts | jq '.items[2].hostId')
d=$(curl -XGET -u admin:admin http://localhost:7180/api/v44/hosts | jq '.items[3].hostId')

echo '{
 "items" : [ {
    "hostId" : '$a' 
  }, {
    "hostId" : '$b'
  }, {
   "hostId" : '$c'
  }, {
    "hostId" : '$d'
  } ]
}' |  tee /home/admin/cm-cluster-hosts