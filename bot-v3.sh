#!/bin/bash
# USING ANSI COLORS
DO="\e[0;49;95m"
PINK="\e[0;49;35m"
RED="\e[0;49;31m"
GREEN="\u001b[32m"
Gcyan="\e[0;49;33m"
Cyan="\e[0;49;36m"
STOP="\e[0m"
# LOAD Script  
load ()
{
sleep .5
echo -ne .
sleep .5
echo -ne .
sleep .5
echo -ne .
echo -ne .
sleep .5
echo -ne .
sleep .8
}
#COLOUR DECLARATION END
#INTRO STARTED
url=$1
printf "${GREEN}"
echo "                  _   _             _             ______       _    #"
echo "                 | | | |           | |            | ___ \     | |   #"
echo "                 | |_| |_   _ _ __ | |_ ___ _ __  | |_/ / ___ | |_  #"
echo "                 |  _  | | | | '_ \| __/ _ \ '__| | ___ \/ _ \| __| #"
echo "                 | | | | |_| | | | | ||  __/ |    | |_/ / (_) | |_  #"
echo "                 \_| |_/\__,_|_| |_|\__\___|_|    \____/ \___/ \__| #"
printf "${STOP}"
echo ""
echo -e " ${Cyan}                       #| Every Villain is a Hero in his Own Mind |#"
echo -e " ${PINK}                       #| Vill4!n'S Team's Bug Hunting T00ls      |#"
echo -e " ${Gcyan}                       #| Script Name : Hunter BOT                |#"
echo -e " ${DO}                       #| Coded by J4ck 5P4RR0w || Version: @3.7  |#"
echo ""
echo ""
if [ ! -d "Report/$url" ];then
	mkdir Report/$url
fi

if [ ! -d 'Report/$url/SubDomain' ];then
        mkdir Report/$url/SubDomain
fi
if [ ! -d 'Report/$url/SubDomain/takeover' ];then
        mkdir Report/$url/SubDomain/takeover
fi
if [ ! -d 'Report/$url/Directory' ];then
        mkdir Report/$url/Directory
fi
if [ ! -d 'Report/$url/Peramiter' ];then
        mkdir Report/$url/Peramiter
fi
if [ ! -d 'Report/$url/WAScan_Report' ];then
        mkdir Report/$url/WAScan_Report
fi
if [ ! -d 'Report/$url/Web-Spider' ];then
        mkdir Report/$url/Web-Spider
fi
if [ ! -d 'Report/$url/Vulnerable' ];then
        mkdir Report/$url/Vulnerable
fi
if [ ! -d 'Report/$url/EyeWitness' ];then
        mkdir Report/$url/EyeWitness
fi
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED} [+] Searching Subdomain On SUBLIST3R "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python Tools/Sublist3r/sublist3r.py -d $url -o Report/$url/SubDomain/sub.txt
cat Report/$url/SubDomain/sub.txt | grep $1 >> Report/$url/SubDomain/sub_final.txt
rm Report/$url/SubDomain/sub.txt

#you can bruteforce subdomain if you want :-)

#echo -ne "$RED [+] Subdomain BruteForce with subbrute.. "; load;
#python3 Tools/subbrute/subbrute.py $url > Report/$url/SubDomain/sub.txt
#cat Report/$url/SubDomain/sub.txt | grep $1 >> Report/$url/SubDomain/sub_final.txt
#rm Report/$url/SubDomain/sub.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] SobDomain Enumeration Done."
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED} [+] Checking Alive Domain On Aliver "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python3 Tools/aliver/aliver.py -urls Report/$url/SubDomain/sub_final.txt
mv alive.txt Report/$url/SubDomain/alive.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Separation of alive subdomains has been completed. " 
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Getting Information With Webtech  "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
webtech --update-db > Report/$url/update.txt
rm Report/$url/update.txt
webtech --urls-file=Report/$url/SubDomain/alive.txt > Report/$url/Webtech.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Web technology data collection is complete. "
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED} [+] Find possible Subdomain for Subdomain-Takeover with takeover "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python3 Tools/takeover/takeover.py -l Report/$url/SubDomain/alive.txt -o Report/$url/SubDomain/takeover/takeover1.txt -T 3 -v
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED}[+] Find possible Subdomain for Subdomain-Takeover with ItsOver "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python3 Tools/Subdomain-Takeover/ItsOver.py -l Report/$url/SubDomain/alive.txt
mv takeover.txt Report/$url/SubDomain/takeover/takeover.txt
mv validUrls.txt Report/$url/SubDomain/takeover/validUrls.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Subdomains that can be potentially takenover have been separated."
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED} [+] Testing ClickJacking with Jack "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python3 Tools/j4ck/jack.py Report/$url/SubDomain/alive.txt
mv ClickJacking.txt Report/$url/Vulnerable/ClickJacking.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Done  ."
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED} [+] Checking Missinginsufficient records "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python Tools/spoofcheck/spoofcheck.py $url | tee Report/$url/Vulnerable/spoofcheck.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Done  ."
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED} [+] Backup-File Artifacts Testing "; load; 
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
bfac --list Report/$url/SubDomain/alive.txt --exclude-status-codes 301,400,401,402,404,406,410,429,500,501,502,503,520 -o Report/$url/Vulnerable/bfac.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Done  ."
echo -e "${GREEN}#====================================================================#"

echo -e "${GREEN}#====================================================================#"
echo -ne "${RED} [+] Target Domain Spidering "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python Tools/spider/Web-Spider.py $url Report/$url/Web-Spider/spider1.txt
cat Report/$url/Web-Spider/spider1.txt | sort -u >> Report/$url/Web-Spider/spider.txt
rm Report/$url/Web-Spider/spider1.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Spidering Done ."
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED} [+] CORS Vulnerability Scanning with CORSScanner..."; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python Tools/CORScanner/cors_scan.py -i Report/$url/SubDomain/alive.txt -o Report/$url/Vulnerable/subdomain-cors.txt
python Tools/CORScanner/cors_scan.py -i Report/$url/spider.txt -o Report/$url/Vulnerable/spider-cors.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Done  ."
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED}[+] Searching Directory On Dirsearch  "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python3 Tools/dirsearch/dirsearch.py --url-list Report/$url/SubDomain/alive.txt -E -x 301,400,401,402,404,406,410,429,500,501,502,503,520 -t 50 -b --plain-text-report=Report/$url/Directory/Directory1.txt
cat Report/$url/Directory/Directory1.txt | grep "200" | awk '{ print $3}' >> Report/$url/Directory/Directory-200_1.txt
cat Report/$url/Directory/Directory-200_1.txt | sort -u >> Report/$url/Directory/Directory-200.txt
rm Report/$url/Directory/Directory-200_1.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Hidden directory Search completed ."
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED}[*] Searching Peramiter Via Arjun  "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python3 Tools/Arjun/arjun.py --urls Report/$url/Directory/Directory-200.txt -f Tools/Arjun/db/params.txt --get -o Report/$url/Peramiter/Peramiter.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] The search for the hidden parameter in the hidden directory has been completed."
echo -e "${GREEN}#====================================================================#"
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED}[*] Getting ScreenShoot with EyeWitness "; load;
echo ""; sleep .3;
echo -e "${GREEN}#====================================================================#"
python3 Tools/EyeWitness/Python/EyeWitness.py --web -f Report/$url/SubDomain/alive.txt -d Report/$url/EyeWitness --resolve
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Screenshots of all living subdomains have been taken."
echo -e "${GREEN}#====================================================================#"
clear
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Automatic Web Application Scanner Runing... (Just Target MainDomain)"
echo -e "${GREEN}#====================================================================#"
python Tools/WAScan/wascan.py --url http://$url --scan 5 | tee Report/$url/WAScan_Report/Scan_Report.txt
echo -e "${GREEN}#====================================================================#"
echo -e "${RED} [+] Scan completed ."
echo -e "${GREEN}#====================================================================#"
echo ""
echo ""
echo -e " ${Cyan}                #| Thanks for Using M3                     |#"
echo -e " ${PINK}                #| Special Thanks [+] Mr_Villain           |#"
echo -e " ${Gcyan}                #| CopyRight © Vill4!n'S Team              |#" 
