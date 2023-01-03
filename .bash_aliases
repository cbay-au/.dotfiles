
#################################################################
##                      MY ALIASES                             ##
#################################################################

# Miscelanious

    alias sdn='shutdown now'
    alias v1='grep VERSION /etc/os-release'
    alias v2='uname -a'
    alias upd='sudo apt update && sudo apt -y full-upgrade'
    alias baz='gedit .shell_aliases'
    alias bcz='gedit .zshrc'
    alias ba='gedit .bash_aliases'             #used on bash not zsh
    alias bf='gedit ~/zz_functions/functions_1.sh
    alias bc='gedit .bashrc'                   #used on bash not zsh
    alias rep='gedit ~/zz_reports'
    alias fun='gedit ~/zz_functions/functions_1'
    alias funcurl='curl -k -s -o ~/zz_functions/functions_1 https://raw.githubusercontent.com/leighton-0/Aliases-Bashrc-Scripts-and-Functions/master/functions_1 | bash'
    alias xm='snap run xmind'
    alias sudo="sudo "
    alias xxx='sudo youtube-dl -U'
    alias po='popd'
    alias pu='pushd'
    alias assd='cd /media/leighton/Andy_SSD/1_Linux'
    alias ttor='curl -x socks5h://localhost:9050 -s https://check.torproject.org/api/ip'    #test if TOR working

    alias t9='echo testing'

    alias srr='. .bashrc && . .bash_aliases'   #used on bash not zsh
    alias srrz='. ~/.zshrc && . ~/.shell_aliases
    alias jor='gedit /media/leighton/Andy_SSD/1_Linux/journal'

    alias lmacc1='/usr/local/bin/./lmacc1.sh'
    alias lmacc0='/usr/local/bin/./lmacc0.sh'
    #alias tor='sudo -u kali -H torbrowser-launcher'
    
# Reconftw
    alias recon='./reconftw.sh -d ecosymbiosis.com -f'
    alias recon-f=
    
# Docker
    alias dvwa='docker run --rm -it -p 80:80 vulnerables/web-dvwa'
    
# Snap
    alias srx='snap run xmind'
    alias sry='snap run youtube-dl'
    alias sl='snap list'
    
# Digital Ocean
    alias do1='ssh root@xxx.65.55.161'
    alias dig='ssh root@134.122.111.227'
    alias do3='ssh root@134.122.111.227'
    alias do4='ssh root@134.122.111.227'

# VPN
    alias vpns='nordvpn status'
    alias vpnset='nordvpn settings'
    alias vpnc='nordvpn connect Sweden'
    alias vpndc='nordvpn connect Double_VPN'
    alias vpno='s obfuscate on'
    alias vpnuk='nordvpn c 2195'
    alias ethers='cat >> /.config/wireshark/ethers
    alias vpnhk='nordvpn connect Hong_Kong'

# disk usage
    alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

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
    alias iplocal='ifconfig en0 | grep --word-regexp inet | awk "{print $2}"'
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
    alias ls="ls -la"
    alias la="ls -a"
    alias ll="ls -al"

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

    sudo service <ServiceName> status
    sudo service <ServiceName> stop
    sudo service <ServiceName> start
    sudo service <ServiceName> restart

    sudo systemctl status <ServiceName>
  	sudo systemctl stop <ServiceName>
    sudo systemctl start <ServiceName>
    sudo systemctl restart <ServiceName>
