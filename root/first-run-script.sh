#!/bin/bash

function check_if_already_joined {
   # Check if I'm part of the cluster
   NUMBER_OF_PEERS=`gluster peer status | grep "Number of Peers:" | awk -F: '{print $2}'`
   if [ ${NUMBER_OF_PEERS} -ne 0 ]; then
      # This container is already part of the cluster
      echo "=> This container is already joined with nodes ${GLUSTER_PEERS}, skipping joining ..."
      exit 0
   fi
}

echo "=> Waiting for glusterd to start..."
sleep 10

check_if_already_joined

## Check if the User did gave the Service_Name as an Enviromental Variable. We need this to check for any container that is part of the service. Docker itself does not give us a way to get this information on another way so we are forced to use this small workaround :(

if [ "${SERVICE_NAME}" == "**ChangeMe**" -o -z "${SERVICE_NAME}" ]; then
 echo "*** ERROR: You did not change the SERVICE_NAME Variable! You need to define SERVICE_NAME in the Enviromental Variables and start the Container agian ;) - Bye ..."
 exit 1
 else
   echo "*** The Service Name is ${SERVICE_NAME} , and now I check if I can determine the IPv4 Adresses of the other containers "
fi

## Now we got our Service Name for the workaround

export GLUSTER_PEERS=`dig +short ${SERVICE_NAME}`
if [ -z "${GLUSTER_PEERS}" ]; then
 echo "*** WARNING: Could not determine which containers are part of this service '${SERVICE_NAME}'. Maybe you did write the worng name here as Service Name :( "
 exit 1 
 else
   echo "We now now the IPv4 Adresses of the GlusterFS Container : ${GLUSTER_PEERS}" 
fi

