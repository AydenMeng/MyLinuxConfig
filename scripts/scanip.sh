#!/bin/bash
>IP
inputip=$(ip a | grep "\<inet\>" | grep -v "127.0.0.1" | awk '{print $2}' | sed 's/\.\w\+\/\w\+$//g')
tip=$inputip
for n in `seq 254`
do
	{
	res=`ping $tip.$n -c 1 | grep ttl | awk '{print $4}' | awk '{print $1}'`
	#ping $tip.$n -c 1 | grep ttl | awk '{print $4}' | awk -F: '{print $1}'
	if [ $res > 0 ]
	#if [ $? -eq 0 ]
	then
		echo "$tip.$n" | tee -a IP
	fi
	}&
#	echo ''
done
wait
