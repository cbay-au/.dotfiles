
#!bin/bash

#################################################################
##                      MY FUNCTIONS                           ##
#################################################################

# Add this to the .bashrc file
#      . ~/zz_functions/functions

# This function add, commits & pushes changes from local to Github repo's.
# from:
#   ~/.dotfiles
#   ~/mycode/repos/cheatsheets
#   ~/mycode/repos/my_random_scripts
gsyncf() {
   printf "\n\n${RED}===sync my_random_scrips===${NORMAL}\n"
   cd ~/mycode/repos/my_random_scripts
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   sleep 5
   printf "\n\n${RED===}sync cheat_sheets===${NORMAL}\n"
   cd ~/mycode/repos/cheat_sheets
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   sleep 5
   printf "\n\n${RED}===sync dotfiles===${NORMAL}\n"
   cd ~/.dotfiles
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   cd ~/
   sleep 5
   printf " /n"
   printf " /n"
   printf "\n\n\n${BLUE}============================================================\n"
   printf "${RED} Finished Sync'ing\n"
   printf "${BLUE}============================================================${NORMAL}\n\n\n\n"
}

# extract anything

extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1    ;;
      *.tar.gz) tar xzf $1    ;;
      *.bz2)    bunzip2 $1    ;;
      *.rar)    rar x $1    ;;
      *.gz)   gunzip $1   ;;
      *.tar)    tar xf $1   ;;
      *.tbz2)   tar xjf $1    ;;
      *.tgz)    tar xzf $1    ;;
      *.zip)    unzip $1    ;;
      *.Z)    uncompress $1 ;;
      *)      echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}



mybanner()
{
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                          |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+------------------------------------------+"
}


find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}


# Grep (search) through your history for previous run commands
function hg() {
    history | grep "$1";
}


# start a new project with Git:
function git_init() {
    if [ -z "$1" ]; then
        printf "%s\n" "Please provide a directory name.";
    else
        mkdir "$1";
        builtin cd "$1";
        pwd;
        git init;
        touch readme.md .gitignore LICENSE;
        echo "# $(basename $PWD)" >> readme.md
    fi
}

#+++++++++++++++++++++++++++++++++++++++++++
airgeddon ()  {
	cd airgeddon
	./airgeddon.sh
}
#+++++++++++++++++++++++++++++++++++++++++++
fluxion ()  {
	cd fluxion
	./fluxion.sh
}

# IP Address & Location
kkk () {
	#echo "sets up anon IP & MAC"
	#lmacc0
	#sleep 30
	nordvpn connect Double_VPN
	sleep 30
	#nordvpn set killswitch enable
	#sleep 10
	nordvpn status
}
#=====
#alias clone='echo dd if=/dev/sdb of=/dev/sdd bs=4096 status=progress'

#+++++++++++++++++++++++++++++++++++++++++++
#USER DEFINED SHELL FUNCTIONS
#---------DISK UTILISATION REPORT
ds () {
	echo "Disk space utilisation for $HOSTNAME"
	df -h
}
#=======================================
# --------KALI UPDATE
upd () {
	grep VERSION /etc/os-release > lb4upd.txt && uname -a >> lb4upd.txt
	echo "Update Kali"
	apt update && apt -y full-upgrade
	apt-get update --fix-missing
	apt autoremove
	grep VERSION /etc/os-release > laftupd.txt && uname -a >> laftupd.txt
	echo "Before upgrade"
	cat lb4upd.txt
	echo "After upgrade"
	cat laftupd.txt
}

ping1 () {
	echo "ping test to Telstra"
	ping 139.130.4.5 -c6
}

ping2 () {
	echo "ping test to cloudflare (uses anycast so should be quick)"
	ping  	1.1.1.1
	PID="$!"
	sleep 5
	echo "PID=$PID"
}
#-IP Address & Location
#iploc () {
	#echo "ping test to cloudflare (uses anycast so should be quick)"
	#wget -O ip_loc1 http://ipinfo.io/ip -qO - | wget -O ip_loc2 ~$ curl http://api.db-ip.com/v2/free/
	#wget -O ip_loc2 ~$ curl http://api.db-ip.com/v2/free/ < ip_loc1
	#wget http://ipinfo.io/ip -qO -
	#sleep 10
	#wget ~$ curl http://api.db-ip.com/v2/free/203.219.72.15
	#./iploc.sh
#}

# Display the current Git branch in the Bash prompt.

function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# Set the prompt.

function bash_prompt(){
    PS1='${debian_chroot:+($debian_chroot)}'${blu}'$(git_branch)'${pur}' \W'${grn}' \$ '${clr}
}


#   Grep (search) through your history for previous run commands:
function hg() {
    history | grep "$1";
}

#   start a new project with Git:
git_init() {
    if [ -z "$1" ]; then
        printf "%s\n" "Please provide a directory name.";
    else
        mkdir "$1";
        builtin cd "$1";
        pwd;
        git init;
        touch readme.md .gitignore LICENSE;
        echo "# $(basename $PWD)" >> readme.md
    fi
}

#   display useful system information when you open the terminal like this:
usefull_info()
{
printf "\n"
printf "   %s\n" "IP ADDR: $(curl ifconfig.me)"
printf "   %s\n" "USER: $(echo $USER)"
printf "   %s\n" "DATE: $(date)"
printf "   %s\n" "UPTIME: $(uptime -p)"
printf "   %s\n" "HOSTNAME: $(hostname -f)"
printf "   %s\n" "CPU: $(awk -F: '/model name/{print $2}' | head -1)"
printf "   %s\n" "KERNEL: $(uname -rms)"
printf "   %s\n" "PACKAGES: $(dpkg --get-selections | wc -l)"
printf "   %s\n" "RESOLUTION: $(xrandr | awk '/\*/{printf $1" "}')"
printf "   %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
printf "\n"
}
