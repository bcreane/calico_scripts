#!/bin/bash

cnc=`docker ps --filter "name=calico-node" --quiet`	# calico-node container (if it's running)

if [ ${#cnc} -eq 0 ]; then
	echo No calico-node container is running
else
	echo calico-node container: ${cnc}
fi

