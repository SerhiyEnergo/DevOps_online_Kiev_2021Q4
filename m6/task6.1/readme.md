	TASK 6.1
1. Create virtual machines connection according to figure
	1: VM1 and VM2 need configuration VM1 internal and NAT interface,
	gateway for VM2; 
	2: VM2 internal interface

2. VM2 has one interface (internal), VM1 has 2 interfaces (NAT and internal).
Configure all network interfaces in order to make VM2 has an access 
to the Internet (iptables, forward, masquerade).

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


VM1 sudo nano /etc/sysctl.conf 
# Uncomment the next line to enable packet forwarding for IPv4
net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o enp0s8 -j MASQUERADE
sudo iptables -A FORWARD -s 192.168.1.222 -o enp0s8 -j ACCEPT
sudo iptables -t nat -A PREROUTING -i enp0s3 -p tcp --dport 2223 -j DNAT
 --to-destination 192.168.1.222:22

3. Check the route from VM2 to Host
ping 192.168.56.1

4. Check the access to the Internet, (just ping, for example, 8.8.8.8)
ping 8.8.8.8

5. Determine, which resource has an IP address 8.8.8.8.

nslookup 8.8.8.8
8.8.8.8.in-addr.arpa	name = dns.google.

6. Determine, which IP address belongs to resource epam.com
dig epam.com

7. Determine the default gateway for your HOST and display routing table.
route -n
route
ip route show

8. Trace the route to google.com.

traceroute google.com

