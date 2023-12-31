#!/bin/bash

# Remove the static IP from the Ethernet interface
sudo ip addr del 192.168.2.1/24 dev enp0s25

# Disable IP forwarding
sudo sysctl -w net.ipv4.ip_forward=0

# Flush iptables NAT settings
sudo iptables -t nat -F

# Gracefully kill the simple HTTP server using SIGTERM via pkill
pkill -f 'python -m http.server 8000'
