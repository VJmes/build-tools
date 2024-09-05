#!/usr/bin/env bash

source /etc/os-release

T_GREY="\e[38;5;245m"
T_RESET="\033[0m"

function cpuStats {
	CPU_UTIL=$(mpstat | grep -A 5 "%idle" | tail -n 1 | awk -F ' ' '{print 100 -  $ (NF)}'a)
	CPU_PROCS=$(ps -e | wc -l)

	echo -ne "\t$T_GREY CPU Utilization:$T_RESET\t$CPU_UTIL%\t"
	echo -e "\t$T_GREY Processes:$T_RESET\t$CPU_PROCS\t"
}

function memStats {
	MEM_USE="$(free -m | sed -n 2p | tr -s ' ' | cut -d ' ' -f3)MB"
	MEM_TOTAL="$(free -m | sed -n 2p | tr -s ' ' | cut -d ' ' -f2)MB"

	SWAP_USE="$(free -m | sed -n 3p | tr -s ' ' | cut -d ' ' -f3)MB"
	SWAP_TOTAL="$(free -m | sed -n 3p | tr -s ' ' | cut -d ' ' -f2)MB"

	echo -ne "\t$T_GREY Real RAM Usage:$T_RESET\t$MEM_USE / $MEM_TOTAL"
	echo -e "\t$T_GREY Swap Usage:$T_RESET\t$SWAP_USE / $SWAP_TOTAL"
}

function diskStats {
	DISK_DETAIL="$(df -h / | tail -n1 | tr -s ' ')"
	DISK_USE="$(echo -ne $DISK_DETAIL | cut -d ' ' -f5)"
	DISK_TOTAL="$(echo -ne $DISK_DETAIL | cut -d ' ' -f2)"

	echo -e "\t$T_GREY Usage of /:$T_RESET\t\t$DISK_USE of $DISK_TOTAL\t"
}

function networkStats {
	ROUTED_IP="$(ip route get 1.1.1.1 | tr -s ' ' | cut -d ' ' -f 7 | head -1)"

	echo -e "\t$T_GREY Default Routed IP:$T_RESET\t$ROUTED_IP"
}

source /etc/os-release

echo -ne "\nSuccessfully connected to"
case "${NAME,,}" in
	*centos*|*rocky*)
    OS_COLOR="\e[38;5;118m"
	;;
	*ubuntu*)
    OS_COLOR="\e[38;5;208m"
	;;
	*alpine*)
    OS_COLOR="\e[38;5;014m"
	;;
esac

echo -e "$OS_COLOR $HOSTNAME\033[0m"
echo -e "Currently running$OS_COLOR $PRETTY_NAME\033[0m"

echo -e "\nCurrent system time: $(date +'%I:%M%P %d/%m/%Y %Z')\n"
echo -e "Statistics as of login:"

cpuStats
memStats
diskStats
networkStats

echo -e "\n"
