#!/bin/bash


a=$(curl -XGET -u admin:admin http://localhost:7180/api/v44/hosts | jq '.items[0].hostId')
b=$(curl -XGET -u admin:admin http://localhost:7180/api/v44/hosts | jq '.items[1].hostId')
c=$(curl -XGET -u admin:admin http://localhost:7180/api/v44/hosts | jq '.items[2].hostId')
d=$(curl -XGET -u admin:admin http://localhost:7180/api/v44/hosts | jq '.items[3].hostId')

echo '{
 "items" : [ {
    "name" : "gatewayhost",
    "type" : "SECONDARYNAMENODE",
    "hostRef" : {
    "hostId" : '$a'
   }  
  }, {
    "name" : "master",
    "type" : "NAMENODE",
    "hostRef" : {    
    "hostId" : '$b'
   } 
  }, {
     "name" : "worker1",
    "type" : "DATANODE",
    "hostRef" : {   
   "hostId" : '$c'
  } 
  }, {
    "name" : "worker2",
    "type" : "DATANODE",
    "hostRef" : {
    "hostId" : '$d'
   } 
  } ]
}' |  tee /home/admin/cm-roles