
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
Footer
