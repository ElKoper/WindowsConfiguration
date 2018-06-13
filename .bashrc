# Aliases ---------------------------------------------------------------------
# use coloured commands
# alias diff="colordiff"
alias grep="grep --color"
alias ls="ls --color=auto"

# cd
ATF_PATH='/c/ATF/'
alias atf='cd $ATF_PATH'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# grep
alias grin="grep -rin"
alias ghist="history | grep"
alias gfind="find | grep"

#ls
alias la='ls -a'
alias ll='ls -lah'

# Source another bashrc parts -------------------------------------------------
if [ -f ~/.bashrc_git.sh ];    then source ~/.bashrc_git.sh;    fi

