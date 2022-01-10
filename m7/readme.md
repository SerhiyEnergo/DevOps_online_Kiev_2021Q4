TASK 7.1
A. Create a script that uses the following keys:

1. When starting without parameters,
it will display a list of possible keys and their description.

#!/bin/bash

#the comamnd ss lists opened TCP ports ipv4
echo "Scaning open ports:"
ss -ant4  

#Show ip adress and install NMAP for scaning network
test -e /usr/bin/nmap
if [[ "$?" == "0" ]]
then 
	echo "NMAP is work and go to scaning network"
else
	echo "NMAP need install"
sudo apt install nmap -y
fi

#Scanning network with NMAP

addr=$1
echo "Find hosts in network:"
nmap -sP $addr | awk 'NR % 2 == 0 {print "Hostname:" $5 "   " "IP Address:" $6}' | sed 's/(//g; s/)//g'

#Comand for display list and print meaning
if [[ "$#" == "0" ]]
then 
	echo "Script show actually arguments:"
	echo -e "\033[32m Display IP addres all hosts for subnet used argument  --all"
	echo -e "\033[33m Display list connect TCP port used argument --target 192.168.1.*"
	echo -e "\033[0m"
exit 0
fi


#Script searc wiht parametr
if [ "$1" == "--all" ]
then
	portscan
elif [ "$1" == "--target" ]
then
	netstat $2
fi
