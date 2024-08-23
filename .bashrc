
#############################################################
##    TO BE ADDED TO .bashrc FILE                          ##
#############################################################


# Use the echo command to append lines to the .bashrc script
# eg.
  #echo 'export APP=/opt/tinyos-2.x/apps' >> ~/.bashrc

export EDITOR="nano"
export PATH=/home/user/bin:$PATH

export PATH="$PATH:.bash_aliases"
#export HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT='%F '




export HISTCONTROL=erasedups # don't store duplicate lines
export HISTSIZE=100000 #remember 100k unique lines
shopt -s histappend

echo 'export HISTCONTROL=ignoredups' >>  ~/.bashrc && source ~/.bashrc        # ignore duplicate commands in the history.
    echo 'export HISTTIMEFORMAT= %D' >> ~/.bashrc && source ~/.bashrc
    echo 'export HISTSIZE=5000' >> ~/.bashrc && source ~/.bashrc
    echo 'export HISTFILESIZE=10000' >> ~/.bashrc && source ~/.bashrc
    echo 'shopt -s histappend' >> /root/.bashrc                                            # Append Bash Commands to History File
    echo 'export PROMPT_COMMAND = history -a' >> /root/.bashrc                                    # Store Bash History Immediately
    echo 'export HISTIGNORE=ls:ps:history' >> /root/.bashrc                              # Ignore Specific Commands
    echo 'shopt -s expand_aliases' >> /root/.bashrc                                                        # enable command aliasing
    echo 'alias do1="curl -k -s https://raw.githubusercontent.com/Gracetown58/DO/main/DO_Setup_Dev.sh | bash"'
    echo 'alias orgrc="rm .bashrc; mv .bashrc.bak .bashrc"'
. .bashrc && . .bash_aliases'

# setup for digall
digall()
{
  local color_restore='\033[0m'
  local color_red='\033[0;31m'
  local color_light_green='\033[1;32m'
  local color_light_blue='\033[1;34m'
  local color_light_cyan='\033[1;36m'

  if [ -z "$1" ]; then
    echo -e "${color_red}Error: Please pass domain as first arg${color_restore}"
  else
    echo -e "${color_light_blue}Queries: (dig +noall +answer '$1' '<type>')...${color_light_cyan}\n"
    # CNAME isn't needed because it will show up as the other record types
    for t in SOA NS SPF TXT MX AAAA A; do
      echo -e "${color_light_green}Querying for $t records...${color_restore}${color_light_cyan}"
      dig +noall +answer "$1" "${t}"
      echo -e "${color_restore}"
    done
  fi
}

# This shows the shell nubber in the prompt
PS1="Shell:${SHLVL} \w\$ "
export PS1
HISTTIMEFORMAT=" %d\%m\%y "



Footer
