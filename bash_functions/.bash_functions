
#!/bin/bash

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

fun_test() {
printf "${RED}fun_test working ok${NORMAL}\n"
}

csdirf() {
   cd ~/mycode/repos/cheat_sheets && ls -la
}

gsyncf() {
   printf "\n\n${RED}===sync My_Random_Scrips===${NORMAL}\n"
#   echo "enter the password"
#  read -s PASSWORD
   openssl enc -aes-256-cbc -salt -in ~/mycode/.env -out ~/mycode/repos/My_Random_Scripts/.env.enc -k $PASSWORD
   echo "File encrypted successfully"
   cd ~/mycode/repos/My_Random_Scripts
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   sleep 5
   printf "\n\n${RED}===sync cheat_sheets===${NORMAL}\n"
   cd ~/mycode/repos/cheat_sheets
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   sleep 5
   printf "\n\n${RED}===sync dotfiles===${NORMAL}\n"
   cd ~/mycode/repos/.dotfiles
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   cd ~/
   sleep 5
   printf " \n"
   printf "\n\n\n${BLUE}============================================================\n"
   printf "${RED} ** Finished Sync'ing - Local is now UPD with github repo **\n"
   printf "${BLUE}============================================================${NORMAL}\n\n\n\n"
}

test_fun() {
echo "functions working ok"
}

# functions for th todo.txt program
tla() { [[ $# -eq 0 ]] && cat "${TODO}" || (echo "$(echo $* | md5sum | cut -c 1-4) 👉 $*" > "${TODO}" && cat "${TODO}") ;}
# $# is the number of posutuion parameters; if this is equal to 0 then is lists all the todo's
# or

tlr() { sed -i '' "/^$*/d" $TODO && cat ${TODO} ;}

tl() { cat ${TODO} ;}

tlc() { cat /dev/null > ${TODO} ;}
# tla (Todo List Add): Adds tasks to the list. It generates a 4-character md5 hash to serve as a unique identifier for each task.
# If no argument is passed, it displays the current task list.
# tlr (Todo List Remove): Removes tasks from the list by matching their md5 identifier.
# tl (Todo List): Simply displays the current list.
# tlc (Todo List Clear): Clears the entire task list, removing all entries at once.
# At the end of each operation, the current state of your TODO list will be displayed.


# extract anything

extract() {
  if [[ -f $1 ]]; then
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


mybanner() {
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

test117() {
echo "working upto line 117"
}
if [[ 1 -eq 0 ]]; then
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
	apt update --fix-missing
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
fi
