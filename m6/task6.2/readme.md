	TASK 6.2
1. Use already created internal-network for three VMs (VM1-VM3). VM1 has NAT and internal,
VM2, VM3 – internal only interfaces.

Create local network for VM1+VM2+VM3 and VM1 NAT

VM1 configure interface enp0s9
ls /sys/class/net
enp0s8(NAT)  enp0s9(internal network VM1+VM2)  lo

sudo nano /etc/netplan/01-network-manager-all.yaml
ethernets:
    enp0s9:
      dhcp4: no
      addresses: [192.168.1.111/24]
      gateway4: 192.168.1.1
      nameservers:
       addresses: [8.8.8.8,8.8.4.4]

VM2 configure interface enp0s3

sudo nano /etc/netplan/01-network-manager-all.yaml
ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.1.222/24]
      gateway4: 192.168.1.111
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]
      routes:
        - to: 0.0.0.0/24
          via: 10.0.3.15

VM3 configure interface
ls /sys/class/net
enp0s3  lo
sudo nano /etc/netplan/01-network-manager-all.yaml
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.1.233/24]
      gateway4: 192.168.1.111
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]
      routes:
        - to: 0.0.0.0/24
          via: 10.0.3.15

2. Install and configure DHCP server on VM1. 
   Configure DNSMASQ
sudo apt-get install dnsmasq
sudo nano -l /etc/dnsmasq.conf

#create user may started server
682 user=serhiy
683 group=serhiy
684 #DHCP interfase for my server
685 interface=epn0s8
686 #leasing pool adresses for client
687 dhcp-range=192.168.1.100,192.168.1.240,24H
688 #IP and MAC for host VM2 VM3
689 dhcp-host=08:00:27:6A:78:B3,VM2,192.168.1.222
690 dhcp-host=08:00:27:6E:21:3A,VM3,192.168.1.233
691 #default gateway Router=3 example dhsp-option=3,192.168.1.1
692 dhcp-option=option:router,192.168.1.1
693 #DNS server=6 or dhsp-option=option:dns-server,192.168.1.1
694 dhcp-option=6,192.168.1.1
695 #ip leasing file
696 dhcp-leasefile=/var/lib/dnsmasq/dnsmasq.leases
697 #To make the DHCP server to authoritative mode
698 dhcp-authoritative
699 #setting upstream  DNS-server example GOOGLE:
700 server=8.8.8.8

dnsmasq --test

sudo mkdir /var/lib/dnsmasq
sudo touch /var/lib/dnsmasq/dnsmasq.leases
sudo systemctl disable systemd-resolved
sudo systemctl mask systemd-resolved
sudo systemctl stop systemd-resolved  

sudo systemctl start dnsmasq
sudo systemctl status dnsmasq 

	Add rule iptables for forword SSH VM3

sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 2224
 -j DNAT  --to-destination 192.168.1.233:22

VM2 configure interface
ls /sys/class/net
enp0s3  lo
sudo nano /etc/netplan/01-network-manager-all.yaml

network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s3:
      dhcp4: true
      addresses: [192.168.1.233/24]
      gateway4: 192.168.1.111
      nameservers:
        addresses: [8.8.8.8,8.8.4.4]
      routes:
        - to: 0.0.0.0/24
          via: 10.0.3.15
