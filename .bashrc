# -------------------------------------------------------
# .bashrc by <me@micrypt.com> last updated on 2012/07/18
# -------------------------------------------------------

# user specific settings -- set WORK_DIRECTORY to enable related functionality
export WORK_DIRECTORY=~/work

if [ -d /usr/local/bin ] ; then
    PATH=/usr/local/bin:"${PATH}"
fi

# include the user's local bin on the PATH if it exists
if [ -d ~/.local/bin ] ; then
    PATH=~/.local/bin:"${PATH}"
fi

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
    platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='darwin'
fi 

# enable bash completion if available
if [ -f ~/.local/etc/bash_completion ]; then
    . ~/.local/etc/bash_completion
fi

if ! type "brew" > /dev/null; then
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

# only search directories on cd tab completion
complete -d cd

# ignore case with tab completion
set completion-ignore-case On

# less highlighting
export LESSOPEN='|/usr/local/Cellar/source-highlight/3.1.5/bin/src-hilite-lesspipe.sh %s'
export LESS=' -R '

# aliases
alias ampenv="source ~/silo/ampify/environ/ampenv.sh && unset GOROOT"
alias chx='chmod +x'
alias ffind="find * -type f"
alias github='git push origin master'
alias gitupstream='git push upstream master'
alias gitpages='git push origin gh-pages'
alias gitd='git diff --cached'
alias gitm='git merge origin/master'
alias gits='git status -sb .'
alias gitu='git remote update'
alias l='ls -G'
alias la='ls -a'
alias lk='security lock-keychain'
alias ll='ls -al'
alias p='cd ..'
alias pp='cd ../..'
alias ppp='cd ../../..'
alias pppp='cd ../../../..'
alias sl='ls'
alias rmrf='rm -rf'
alias rmsvn='rm -rf .svn; rm -rf */.svn; rm -rf */*/.svn; rm -rf */*/*/.svn; rm -rf */*/*/*/.svn'
alias screen='screen -e^Ff'
alias sha256='shasum -a 256'
alias svnchange='svn status | grep -v "^[?XP]" | grep -v "^$"'
alias svnstatus='svn status"'
alias untar='tar xzvf'
alias vi='vim'

if [[ $platform == 'darwin' ]]; then
    alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
fi

# Git utilities
source ~/.local/shell/git-completion.bash
source ~/.local/shell/git-prompt.sh
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensty
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensty
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensty backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[10;95m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

_parse_git_dirty() {
  [ -n "$(\git status --short 2> /dev/null)" ] && echo " ±"
}

export PS1='\[\e[1;32m\]\u\[\e[0;32m\]@\h\[\e[0m\] \w $(__git_ps1 "\e[0;31m\][\e[1;31m\]%s\[\e[0;31m\]$(_parse_git_dirty)] ")\[\e[0m\]➤  '
