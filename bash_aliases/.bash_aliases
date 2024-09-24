
#################################################################
##                      MY ALIASES                             ##
#################################################################

# To print alias without executing use \
# Miscelanious
    alias teh='the'
    alias testa='echo "aliases working ok"'
    alias v1='grep VERSION /etc/os-release'
    alias v2='uname -a'
    alias upd='sudo apt update && sudo apt -y full-upgrade'
    alias ba='nano ~/.bash_aliases'           
    alias bc='nano ~/.bashrc'
    alias bf='nano ~/.bash_functions'             
    alias sudo="sudo "
    alias xxx='sudo youtube-dl -U'
    alias po='popd'
    alias pu='pushd'
    alias assd='cd /media/leighton/Andy_SSD/1_Linux'
    alias srr='. ~/.bashrc'  		 # source .bashrc
    alias srrf='. ~/.bash_functions'
    # alias t='~/mycode/repos/My_Random_scripts/todo/todo.sh'
    alias t=bin/todo/todo    
    alias d=bin/todo/todone    
# Reconftw
    alias recon='./reconftw.sh -d $1 -f'
    
# Docker
    alias df='docker-compose'
    alias deb_1='docker run -it -d --name leigh_debian_v0 leigh_debian:v0 /bin/bash'   # load custom debian image
    alias deb_2='docker exec -it leigh_debian_v0 /bin/bash'                            # run custom debian image
    
# VPN - used when using nordvpn - needs uncommenting
    #alias vpns='nordvpn status'
    #alias vpnset='nordvpn settings'
    #alias vpnc='nordvpn connect Sweden'
    #alias vpndc='nordvpn connect Double_VPN'
    #alias vpno='s obfuscate on'
    #alias vpnuk='nordvpn c 2195'
    #alias vpnhk='nordvpn connect Hong_Kong'

# fast back cd
    alias ..='cd ..'
    alias ...='cd ../../../'
    alias ....='cd ../../../../'
    alias .....='cd ../../../../'
    alias .4='cd ../../../../'
    alias .5='cd ../../../../..'

# show pathes
    alias path='echo -e ${PATH//:/\\n}'

#show top process eating RAM
    alias psmem='ps auxf | sort -nr -k 4'
    alias psmem10='ps auxf | sort -nr -k 4 | head -10'

#show top process eating CPU
    alias pscpu='ps auxf | sort -nr -k 3'
    alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Print out the local IP on en0.
    alias iplocal='ip en0 | grep --word-regexp inet | awk "{print $2}"'
    #alias ip='wget http://ipinfo.io/ip -qO -'
    alias iploc='./iploc.sh'


    alias grep='grep --color=auto'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'


# History commands
    alias h="history"
    alias h1="history 10"
    alias h2="history 20"
    alias h3="history 30"
    alias hgrep='history | grep'
    alias his='history | grep'

# List commands
    alias l="ls"
    alias l='ls -lAh'
    alias ls="ls --color -F"
    alias la="ls -a"
    alias ll='ls -la'

# Ping Commands
    alias pg="ping google.com -c 5"
    alias pt="ping facebook.com -c 5"
    alias ping="ping -c 5"
    alias fastping="ping -c 100 -s.2"

# Exit Command
    alias :q="exit"
    alias ext="exit"
    alias xt="exit"
    alias by="exit"
    alias bye="exit"
    alias die="exit"
    alias quit="exit"
    alias sdn='shutdown now'


# Parenting changing perms on /
    alias chown='chown --preserve-root'
    alias chmod='chmod --preserve-root'
    alias chgrp='chgrp --preserve-root'


# System state
    alias reboot="sudo /sbin/reboot"
    alias poweroff="sudo /sbin/poweroff"
    alias halt="sudo /sbin/halt"
    alias shutdown="sudo /sbin/shutdown"
    alias flighton='sudo rfkill block all'
    alias flightoff='sudo rfkill unblock all'
    alias snr='sudo service network-manager restart'


# Start & Stop Services
    alias snms='service network-manager start'
    alias snms1='systemctl restart NetworkManager'

# Cheat Sheets
   alias csdir='csdirf'		# move to cheat sheet direcotry & print file listing
   alias csnew='nano ~/mycode/repos/cheat_sheets/${1}'			# add a cs file name.md as a parameter to the alias
   alias ctmux='nano ~/mycode/repos/cheat_sheets/tmux.md'
   alias cstree='nano ~/mycode/repos/cheat_sheets/tree.md'
   alias cshttp='cat ~/mycode/repos/cheat_sheets/http_codes.md'
   alias csgists='nano ~/mycode/repos/cheat_sheets/gists.md'
   alias cswpscan='nano ~/mycode/repos/cheat_sheets/wpscan.md'
   alias cssed='nano ~/mycode/repos/cheat_sheets/sed.md'
   alias csawk='nano ~/mycode/repos/cheat_sheets/awk.md'
