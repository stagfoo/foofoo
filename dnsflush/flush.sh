#!/bin/zsh

# Turn off and on Wi-Fi
sudo networksetup -setnetworkserviceenabled Wi-Fi off

# Flush route
sudo route -n flush;

# extra Flush DNS
# sudo killall -HUP mDNSResponder;

# Wait for 15 seconds
sleep 15;

# Turn on Wi-Fi
sudo networksetup -setnetworkserviceenabled Wi-Fi on