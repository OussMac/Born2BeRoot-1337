#!/bin/bash

# Architecture details
ARCH=$(uname -a)

# Cpu Count (Physical And Logical)
PCPU=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)
VCPU=$(grep "processor" /proc/cpuinfo| sort | uniq | wc -l)

# Memory Usage
USED_MEM=$(free --mega | grep "Mem:" | awk '{printf $3}')
TOTAL_MEM=$(free --mega | grep "Mem:" | awk '{printf $2"MB"}')
PREC_MEM=$(free --mega | grep "Mem:" | awk '{printf ("%.2f%%", ($3/$2)*100)}')

# Disk usage
USED_DISK=$(df -BM | grep "^/dev/" | awk '{UD += $3} END {printf UD}')
TOTAL_DISK=$(df -BM | grep "^/dev/" | awk '{TD +=$2} END {printf("%d", (TD/1024))}')
PERC_DISK=$(df -BM | grep "^/dev/" | awk '{UD += $3} {TD += $2} END {printf("%.2f%%", (UD/TD)*100)}')

# LVM Usage
LVM=$(lsblk | awk '{print $6}' | grep "lvm" | sort | uniq | wc -l)
LVM_USAGE=$(if [ $LVM -gt 0 ]; then echo "yes"; else echo "no"; fi)

# CPU Load
CPU_LOAD=$(iostat | grep -A 1 "idle" | grep "^ " | awk '{printf("%.1f%%", 100-$6)}')

# Last Boot time
LASTB=$(who -b | awk '{printf $3" "$4}') 

# Establiched TCP connections count
TCP=$(netstat -t | grep "ESTABLISHED" | wc -l)

# logged in users count
USER_COUNT=$(who -u | awk '{print $1}' | uniq | wc -l)

# Network info
IP=$(hostname -I)
MAC=$(ip link | grep "link/ether" | awk '{printf $2}')

# sudo count
SUDO=$(journalctl -q _COMM=sudo | grep -c "COMMAND")

wall "
	Architecture		: $ARCH
	#CPU physical		: $PCPU
	#vCPU			: $VCPU
	#Memory Usage		: $USED_MEM/$TOTAL_MEM ($PREC_MEM)
	#Disk Usage		: $USED_DISK/$TOTAL_DISK Gb ($PERC_DISK)
	#CPU load		: $CPU_LOAD
	#Last boot		: $LASTB
	#LVM use		: $LVM_USAGE
	#Connections TCP	: $TCP ESTABLISHED
	#User log:		: $USER_COUNT
	#Network		: IP $IP ($MAC)
	#Sudo			: $SUDO cmd
"
