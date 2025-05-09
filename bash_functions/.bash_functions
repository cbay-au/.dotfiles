
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
exit()        # function to run upon exit of shell
{
    echo -e "${RED}Hasta la vista, baby${NORMAL}"
}
trap _exit EXIT
#----------------------------------------------------------------
# This function add, commits & pushes changes from local to Github repo's.
# from:
#   ~/.dotfiles
#   ~/mycode/repos/cheatsheets
#   ~/mycode/repos/my_random_scripts
#   ~/dockerfiles
gsyncf() {
   printf "\n\n${RED}===sync My_Random_Scrips===${NORMAL}\n"
   touch ~/mycode/test_deletex
   touch ~/mycode/.env.tmp
   cat ~/mycode/.env > ~/mycode/.env.tmp		# there are a couple of config files needed to be enc & saved
   cat ~/.config/subfinder/provider-config.yaml >> ~/mycode/.env.tmp
   cat ~/.config/waymore/config.yml >> ~/mycode/.env.tmp
#  echo "enter the password"
#  read -s PASSWORD	PASSWORD is now entered permanently as a env var
   openssl enc -aes-256-cbc -salt -in ~/mycode/.env.tmp -out ~/mycode/repos/my_random_scripts/.env.enc -k $PASSWORD
   echo "File encrypted successfully"
#   rm ~/mycode/.env.tmp		# delete the .enc.tmp file
   cd ~/mycode/repos/my_random_scripts
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
   printf "\n\n${RED}===sync dockerfiles===${NORMAL}\n"
   cd ~/dockerfiles
   git add -A ; git commit -m "changes from $(uname -n) on $(date)" ; git push
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
wpcleanup() {   # in development

   printf "\n\n${BLUE}=======================================================================\n"
   printf "${RED} ** Clean up of a word press mass scan **\n"
   printf "\nThis function removes all 'Scan Aborted' results & their associated lines from\n"
   printf "results of a WPScan mass scan. Also removes the end of line & line feed symbols\n"
   printf "${BLUE}=======================================================================${NORMAL}\n\n\n\n"
   read -p $'${RED} Enter file path to input file: ${NORMAL}' input_filename
   read -p $'${RED} Enter file path to output file: ${NORMAL}' output_filename


awk '/Scan Aborted/ {print NR-2 "," NR+2 "d"}' ${input_filename} | sed -f - ${input_filename} | sed -e 's/\x1b\[[0-9;]*m//g' > ${output_filename}

in=$(grep -c "TARGET NAME" ${input_filename})
out=$(grep -c "TARGET NAME" ${output_filename})

printf "\n ${LGREEN}Before the clean up Target Names:${in}\n"
printf "\n After the clean up Target Names:${out}${NORMAL}\n"

}

#----------------------------------------------------------------
wpoverview() {
# Themes
cat <file name>| sed 's/href=/\n/g' | sed 's/src=/\n/g' | grep 'themes' | cut -d"'" -f2| sort | uniq
# WP Version
cat wpscan_uv-wp_websites.csv-aa_1.1_part.1-2 | grep 'WordPress version [0-9]'
# WP  Plugins
cat <file name>| sed 's/href=/\n/g' | sed 's/src=/\n/g' | grep 'wp-content/plugins/*' | cut -d"'" -f2

}
#----------------------------------------------------------------



#----------------------------------------------------------------
wpfind() {
    echo "Searches for matches for arguments given"
    echo "Outputs frm target name to search argument"
    echo "Terminates after finding the first match"
	echo "USAGE: wpfind <search term " 
if [ $# != 1 ]; then 
	echo "Incorrect number of arguments !" >&2 
fi 

printf "\n\n${LGREEN}=======================================================================${NORMAL}\n"
cat output_filename | sed -n "/TARGET NAME/,/$1/{p; /$1/q}"

}


#----------------------------------------------------------------
wpfind1(){
# This serches for the arguement given ($1). 
# When it finds it it prints the full recoerd of the found target

 printf "\n\n${LGREEN}=======================================================================${NORMAL}\n"
cat output_filename | sed "/.*$1.*\n/p;//g;/TARGET/,/Elapsed/H;//x;D"
}



#----------------------------------------------------------------
diruse() {
if [ $# != 2 ]; then 
	echo "Incorrect number of arguments !" >&2
	echo "USAGE: first argument start dir name second no of dir iin output" 
fi
du -h --max-depth=1 $1 2> /dev/null | sort -hr | tail -n +2 | head -$2
}

#----------------------------------------------------------------
scanaborted() {
# ref :- https://askubuntu.com/questions/1034562/grep-to-return-nth-and-mth-lines-before-and-after-the-match

 printf "\n\n${BLUE}=======================================================================\n"
   printf "${RED}  **  Produces a files of targets which have "ABORTED" in WP Mass Scan  **\n"
   printf "\n       The input files should be from the cleanup1 function\n"
   printf "       Cleans up file so can be used as input for another scan\n"
   printf "       Output file same as input file.aborted\n"
   printf "${BLUE}=======================================================================${NORMAL}\n\n\n\n"
   read -p "${LGREEN} Enter file path to input file: ${NORMAL}" input_filename


if [ $# != 1 ]; then
    echo "Incorrect number of arguments !" >&2
fi

awk '/Scan Aborted/{system("sed -n \"" NR-2 "p\" " FILENAME)}' $1 | cut -d " " -f 3 > $1.aborted
# Looks for the string Scan Aborted and prints two lines above which incude the 
# target name including the string TARGET NAME
# the cut strips of TARGET NAMR leaving the  url only

#awk '/Scan Aborted/{system("sed -n \"" NR-2 "p\" " FILENAME)}' input_filename > deleteop


}

#----------------------------------------------------------------
lmstudio() {
cd ~/Downloads/squashfs-root
./lm-studio
}

#----------------------------------------------------------------
# To run Nordvpn inside a docker container
nvpnd() {
    # Check if TOKEN is set
    if [ -z "$NORDVPN_TOKEN" ]; then
        echo "NORDVPN_TOKEN environment variable is not set."
        return 1
    fi

    # Run the Docker container with necessary options and pass the token

docker run \
  -it \
  --hostname nvpn \
  -v /home/leigh/.env:/.env \
  --cap-add=NET_ADMIN \
  --sysctl net.ipv6.conf.all.disable_ipv6=0 \
  nvpn





    # Optionally, remove the container after use
    # docker rm -f nvpn_container
    # original run command sudo docker run -it --hostname nvpn --cap-add=NET_ADMIN --sysctl net.ipv6.conf.all.disable_ipv6=0 nvpn

}
#----------------------------------------------------------------

ollama() {
docker run -d \
--name ollama \
--gpus all \
-v /mnt/y/ollama/config:/root/.config/ollama \
-v /mnt/y/ollama:/root/.ollama \
-p 11434:11434 \
 ollama/ollama
}

#----------------------------------------------------------------
#Run ReconFTW inside a docker container
reconftw_old () {
docker run -it --rm \
-v "${PWD}/OutputFolder/":'/reconftw/Recon/' \
-v /home/leigh/.env:/.env \
--name reconftw_c \
#six2dez/reconftw:main -d cbay.au -r
reconftw -d cbay.au -r
}

reconftw() {
docker run \
-v $PWD/reconftw.cfg:/root/Tools/reconftw/reconftw.cfg \ 
-v $PWD/Recon/:/root/Tools/reconftw/Recon/ \
--name reconftw_c \
--rm reconftw -d cbay.au -r

}
#----------------------------------------------------------------

#----------------------------------------------------------------


#----------------------------------------------------------------
testfunend() {
printf "${RED}function end working ok${NORMAL}\n"
}
#----------------------------------------------------------------
