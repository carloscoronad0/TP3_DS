#!/bin/bash

# $1 -> Host address
# $2 -> Port used by the host for communication
# $3 -> Topic to which connect
# $4 -> Number of subscribers

createSubscribers()
{
	for i in `seq 1 $4`
	do
		CONTAINERNAME="sub$i"
		isSubscriberAlreadyCreated $CONTAINERNAME

		# Is the container already created
		if (( ! $? )); then
			echo "Creating subscriber number $i"
			docker run -it -e "HOST=$1" -e "PORT=$2" -e "TOPIC=$3" --name $CONTAINERNAME -d subscriber
		fi
	done
}

# $1 -> Container Name
isSubscriberAlreadyCreated()
{
	CONTAINERSCREATED=$(docker ps -a --filter "name=sub" --format "{{.Names}}")
	if [[ $CONTAINERSCREATED == *"$1"* ]];
	then
		echo "Container $1 already exists" >> /dev/tty
		return 1
	fi

	return 0
}

createSubscribers $1 $2 $3 $4
