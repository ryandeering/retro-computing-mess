#!/bin/bash

# Just a simple script to allow packets from a wireless interface to ethernet.
# It assumes the machine that packets are being forwarded to be configured as:

#IP Address: 192.168.2.2
#Subnet Mask: 255.255.255.0
#Default Gateway: 192.168.2.1
#DNS: 8.8.8.8, 1.1.1.1, 8.8.4.4.

# Set static IP for the Ethernet interface
sudo ip addr add 192.168.2.1/24 dev enp0s25

# Enable IP forwarding
sudo sysctl -w net.ipv4.ip_forward=1

# Configure iptables for NAT
sudo iptables -t nat -A POSTROUTING -o wlp3s0 -j MASQUERADE

# Start the simple HTTP server (this is just easier than setting up FTP to be honest)
python -m http.server 8000 &
