#!/bin/bash
RED="\e[0;49;31m"
GREEN="\e[0;49;91m"
echo "#====================================================================#"
echo "#|||||||||||||||||||||  Coded by J4ck 5P4RR0w  ||||||||||||||||||||||#"
echo "#######################  We are the Vill4!n'S ########################"
echo "#--------------------------------------------------------------------#"
echo "#                  TOOLS INSTALLER - Hunter_BOt                      #"
echo "#====================================================================#"
echo " [*] Installing Essential Tools..."
echo " [*] Please Wait..."
#apt-get update
echo " [*] Collecting Tools ..."
if [ ! -d "Tools" ];then
	mkdir Tools
fi
if [ ! -d "Report" ];then
	mkdir Report
fi
cd Tools
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                 Git Clone & Setup = Sublist3r                      #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip install -r requirements.txt
cd ../
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = subbrute                      #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/TheRook/subbrute.git
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = dirsearch                     #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/maurosoria/dirsearch.git
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = bfac                           #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/mazen160/bfac.git
cd bfac
python setup.py install
pip3 install -r requirements.txt
cd ../
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = Arjun                         #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/s0md3v/Arjun.git
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = aliver                        #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/Tanvir0075/aliver.git
cd aliver
pip3 install -r requirement.txt
cd ../
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = webtech                       #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/ShielderSec/webtech.git
cd webtech
pip install webtech
python setup.py install --user
cd ../
echo -e "${GREEN}#====================================================================#"
echo -ne "${RED}#                  Git Clone & Setup = spoofcheck                    #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/BishopFox/spoofcheck.git
cd spoofcheck
pip install -r requirements.txt
cd ../
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = WAScan                        #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/m4ll0k/WAScan.git
cd WAScan 
pip install BeautifulSoup
cd ../
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = Subdomain-Takeover            #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/SaadAhmedx/Subdomain-Takeover.git
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = takeover                      #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/m4ll0k/takeover.git
cd takeover
python3 setup.py install
cd ../
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = CORScanner                    #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/chenjj/CORScanner.git
cd CORScanner
pip install -r requirements.txt
cd ../
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = spider                        #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/Tanvir0075/spider.git
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = j4ck                          #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/antu1024/j4ck.git
cd j4ck
pip3 install -r requirements.txt
cd ../
echo -e "${GREEN}#====================================================================#"
echo -e "${RED}#                  Git Clone & Setup = EyeWitness                    #"
echo -e "${GREEN}#====================================================================#"
git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/Python/setup
chmod +x setup.sh
./setup.sh
cd ../../../../
echo " [*] Installation Done "
echo " [*] ./Peace " 
