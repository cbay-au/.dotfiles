
#!/bin/bash

#################################################################
##                      MY FUNCTIONS                           ##
#################################################################



#----------------------------------------------------------------
testfun() {
printf "${RED}function start working ok ${NORMAL}\n"
#testfunend
}
#----------------------------------------------------------------
function cuttail() # cut last n lines in file, 10 by default
{
    nlines=${2:-10}
    sed -n -e :a -e "1,${nlines}!{P;N;D;};N;ba" $1
}
#----------------------------------------------------------------
function _exit()        # function to run upon exit of shell
{
    echo -e "${RED}Hasta la vista, baby${NC}"
}
trap _exit EXIT
#----------------------------------------------------------------
# This function add, commits & pushes changes from local to Github repo's.
# from:
#   ~/.dotfiles
#   ~/mycode/repos/cheatsheets
#   ~/mycode/repos/my_random_scripts
gsyncf() {
   printf "\n\n${RED}===sync My_Random_Scrips===${NORMAL}\n"
   touch ~/mycode/test_deletex
   touch ~/mycode/.env.tmp
   cat ~/mycode/.env > ~/mycode/.env.tmp		# there are a couple of config files needed to be enc & saved
   cat ~/.config/subfinder/provider-config.yaml >> ~/mycode/.env.tmp
   cat ~/.config/waymore/config.yml >> ~/mycode/.env.tmp
#  echo "enter the password"
#  read -s PASSWORD	PASSWORD is now entered permanently as a env var
   openssl enc -aes-256-cbc -salt -in ~/mycode/.env.tmp -out ~/mycode/repos/My_Random_Scripts/.env.enc -k $PASSWORD
   echo "File encrypted successfully"
#   rm ~/mycode/.env.tmp		# delete the .enc.tmp file
   cd ~/mycode/repos/My_Random_Scripts
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   sleep 5
   printf "\n\n${RED}===sync cheat_sheets===${NORMAL}\n"
   cd ~/mycode/repos/cheat_sheets
#   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push --force ;
   sleep 5
   printf "\n\n${RED}===sync dotfiles===${NORMAL}\n"
   cd ~/mycode/repos/.dotfiles
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   sleep 5
   printf "\n\n${RED}===sync DigitalOcean_Droplet_Setup===${NORMAL}\n"
   cd ~/mycode/repos/DigitalOcean_Droplet_Setup
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
   cd ~/
   sleep 5
   printf " \n"
   printf "\n\n${BLUE}============================================================\n"
   printf "${RED} ** Finished Sync'ing - Local is now UPD with github repo **\n"
   printf "${BLUE}============================================================${NORMAL}\n\n\n\n"
}
#----------------------------------------------------------------
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
#----------------------------------------------------------------
mybanner() {
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                          |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+------------------------------------------+"
}
# under development
mybanner1() {
printf "${LGREEN}"
printf "=================================\n"
figlet -f smblock -w 50 -c WP SCANNER           # a method of indenting
printf "${LYELLOW}"
figlet -f smblock ${0} | sed 's/^/          /'  # another method of indenting
printf "${LGREEN}"
printf "=================================\n"
printf "${NORMAL}"
}
#----------------------------------------------------------------
# Grep (search) through your history for previous run commands
function hg() {
    history | grep "$1"
}
#----------------------------------------------------------------
airgeddon ()  {
	cd airgeddon
	./airgeddon.sh
}
#----------------------------------------------------------------
fluxion ()  {
	cd fluxion
	./fluxion.sh
}
#----------------------------------------------------------------
#DISK UTILISATION REPORT
ds () {
	echo "Disk space utilisation for $HOSTNAME"
	df -h
}
#----------------------------------------------------------------
ping1 () {
	echo "ping test to Telstra"
	ping 139.130.4.5 -c6
}
#----------------------------------------------------------------
ping2 () {
	echo "ping test to cloudflare (uses anycast so should be quick)"
	ping  	1.1.1.1
	PID="$!"
	sleep 5
	echo "PID=$PID"
}
#----------------------------------------------------------------
# to determin the run time for a runnig script
# add to the first line of the script
# SECONDS=0
# add to the last line of script
elapsed () {
    ELAPSED="Elapsed: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
    printf "\n${CYAN}Finished - Runtime = ${ELAPSED}${NORMAL}\n"
}
#----------------------------------------------------------------
# moves deleted files to the waste paper bin (wpb)
# so deleted files are recouverable if i fuck up
# syntax is wpb <file name>
wpb () {
	mv $1 ~/wpb
}
#----------------------------------------------------------------

#----------------------------------------------------------------

#----------------------------------------------------------------

#----------------------------------------------------------------
testfunend() {
printf "${RED}function end working ok${NORMAL}\n"
}
#----------------------------------------------------------------
