#!/bin/bash

domain=$1
RED="\033[1;31m"
YELLOW="\033[1;33m"
RESET="\033[0m"

if [ "$1" == "" ]
then
clear
echo -e " $RED !!! The_Serpent !!! $RESET"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo
echo -e "":-" $YELLOW Please enter a domain. $RESET "
echo -e "":-" $YELLOW Syntex: ./serp_hunt.sh example.com $RESET "
echo
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

else
clear
echo -e " $RED Installing And Checking Requirements.... ${RESET}"
echo .
echo .
sudo apt install figlet toilet python curl -y
sudo apt install python3-pip
echo "This Script Was Made By The_Serpent >update.theserpent7777"
echo "Requirements Installed...."
echo -e "\e[1;32m Press Enter To Continue... \e[0m"
clear
echo -e "\e[1;31m"
figlet Serp_Hunter
echo -e "\e[1;34m Created By \e[1;32m"
toilet -f slant -F gay The_Serpent
echo 
echo -e "\e[1;34m This Script Has Created by The_Serpent For Finding Sub-Domains. this is only for educational purpose not for to harm any website.\e[1;32m"
echo " "

info_path=$domain/info
subdomain_path=$domain/subdomains
screenshot_path=$domain/screenshots


if [ ! -d "$domain" ];then
 	mkdir $domain
fi

if [ ! -d "info_path" ];then
 	mkdir $info_path
fi

if [ ! -d "subdomains" ];then
 	mkdir $subdomain_path
fi

if [ ! -d "screenshots" ];then
 	mkdir $screenshot_path
fi


echo "-------------------------------------------------"
echo -e " $RED [1] whois is running.... $RESET" 
echo "-------------------------------------------------"
whois $1 > $info_path/whois.txt

echo "--------------------------------------------------------"
echo -e " ${RED} [2] subfinder is running.... ${RESET}"
echo "--------------------------------------------------------"
subfinder -d $domain > $subdomain_path/found.txt

echo "-------------------------------------------------------"
echo -e " ${RED} [3] assestfinder is running.... ${RESET}"
echo "-------------------------------------------------------"
assetfinder  $domain >> $subdomain_path/found.txt

echo "-------------------------------------------------------"
echo -e " ${RED} [4] knockpy is running.... ${RESET}"
echo "-------------------------------------------------------"
python3 /home/kali/Hacker/wepapplication/knock/knockpy.py $domain >> found.txt

echo "-------------------------------------------------"
echo -e  " ${RED} [5] checking domains.... ${RESET} "
echo "-------------------------------------------------"
cat  $subdomain_path/found.txt | grep $domain | sort -u | httprobe -p -prefer-https | grep https | sed 's/https\?:\/\///' | tee -a  $subdomain_path/alive.txt

echo "--------------------------------------------------------------------"
echo -e " ${RED} [6] Taking screenshot please wait.... ${RESET} "
echo "--------------------------------------------------------------------"
echo
gowitness file -f $subdomain_path/alive.txt -P $screenshot_path/ --no-http

fi
