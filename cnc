#!/bin/bash

OPTIND=1         # Reset in case getopts has been used previously in the shell.
verbose=0

while getopts "h?v" opt; do
    case "$opt" in
    h|\?)
        echo $0 [-v]
        exit 0
        ;;
    v)  verbose=1
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

cnc=`docker ps --filter "name=calico-node" --quiet`	# calico-node container (if it's running)

if [ ${verbose} -eq 1 ]; then

	if [ ${#cnc} -eq 0 ]; then
		echo No calico-node container is running
	else
		echo calico-node container: ${cnc}
	fi
else
	if [ ${#cnc} -ne 0 ]; then
		echo ${cnc}
	fi
fi

