#!/bin/bash

#apt-get install -y lshw hwinfo


echo
echo
echo "CPU:"
# cpu model
cat /proc/cpuinfo| grep 'model name' | sort | uniq | cut -d':' -f2 | uniq -c | cut -d' ' -f9- 

## cpu count
#cat /proc/cpuinfo| grep 'physical id' | sort | uniq | cut -d':' -f2 | cut -d' ' -f1- | wc -l 
cat /proc/cpuinfo| grep 'model name' | sort | uniq | cut -d':' -f2 | uniq -c | cut -d' ' -f7 

echo
echo
echo "Memory:"
# memory manuf.
dmidecode -t memory | grep 'Manufacturer:' | sort | cut -d':' -f2 | egrep -iv "Manufacturer.*" | uniq -c 

## mem total
#grep MemTotal /proc/meminfo | awk '{print $2,$3}'| awk '{$1=$1/(1024^2); print $1,"GB";}'

# mem size
dmidecode -t memory | grep 'Size:' | grep -iv Installed | sort | uniq | cut -d':' -f2 | cut -d' ' -f2- 

# mem type
dmidecode -t memory | grep 'Type:' | egrep -iv "Error Correction|Unknown" | sort | uniq | cut -d':' -f2 | cut -d' ' -f2- 

# mem speed
dmidecode -t memory | grep "Speed:" | egrep -iv "Clock|Unknown" | sort | uniq | cut -d':' -f2 | cut -d' ' -f2- 

echo
echo
echo "Motherboard:"
# motherboard manu.
dmidecode -t baseboard | grep "Manufacturer: " | sort | uniq | cut -d':' -f2 | cut -d' ' -f2- | egrep -iv "Clock|Manufacturer.*" 

# motherboard model
dmidecode -t baseboard | grep "Product Name: " | grep -v Clock | sort | uniq | cut -d':' -f2 | cut -d' ' -f2- 

echo
echo
echo "Network:"
# netowrk card
lspci | grep -i 'Ethernet controller' | cut -d':' -f3- | uniq -c | cut -d' ' -f9- 

# netowrk card count
lspci | grep -i 'Ethernet controller' | cut -d':' -f3- | uniq -c | cut -d' ' -f7 

echo
echo
echo "Raid:"
# raid controller
lspci | grep 'RAID bus controller' | cut -d ':' -f3- | cut -d' ' -f2- 

echo
echo
echo "Power:"
# power supply name
dmidecode --type 39 | grep 'Name:' | sort | uniq | cut -d ':' -f2- | cut -d' ' -f2- 

# power supply manuf.
dmidecode --type 39 | grep 'Manufacturer:' | sort | uniq | cut -d ':' -f2- | cut -d' ' -f2- 

# power supply count
dmidecode --type 39 | grep 'Plugged: Yes' | wc -l 

echo
echo
echo "disk:"
fdisk -l | grep "Disk /dev/s" | cut -d ':' -f2 | cut -d ',' -f1 | cut -d' ' -f2- | sort | uniq -c
echo
fdisk -l | grep "Disk /dev/n" | cut -d ':' -f2 | cut -d ',' -f1 | cut -d' ' -f2- | sort | uniq -c

exit 0
