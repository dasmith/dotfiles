
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='888888\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

export VIMRUTIME=~/.vim/

if [ "$OS" = "linux" ] ; then
  alias ls='ls --color=auto' # For linux, etc
  # ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
  export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'  #LS_COLORS is not supported by the default ls command in OS-X
else
  alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
fi
export PATH=/opt/local/bin:/Users/dustin/.cabal/bin:/opt/local/sbin:$PATH
export TERM=xterm-color

# History ----------------------------------------------------------
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:[bf]g:exit"


# Misc -------------------------------------------------------------
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Use vi command mode
bind "set editing-mode vi"
set -o vi
bind -m vi-command -r 'v'



function xtitle {  # change the title of your xterm* window
  unset PROMPT_COMMAND
  echo -ne "\033]0;$1\007" 
}

# I got the following from, and mod'd it: http://www.macosxhints.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
  touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
  command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 

}  #"
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file 
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility



# Editors ----------------------------------------------------------
#export EDITOR='gedit'  #Linux/gnome
export EDITOR='vim'  #Command line
export GIT_EDITOR='vim'



# Bring in the other files ----------------------------------------------------
#source ~/.bashrc_help
#source ~/.bashrc_app_specific
source ~/.bashrc
source ~/.aliases

function flac2mp3 {
	flac -d -c "$@" | lame --preset insane - "${@%\.*}.mp3"
}

function cgrep {
	grep -i -B 3  -A 5 "$@"  /bib/papers.bib
}


# Your previous .profile  (if any) is saved as .profile.dpsaved
# Setting the path for DarwinPorts.
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/:/opt/local/bin:/opt/local/sbin:$PATH


test -r /sw/bin/init.sh && . /sw/bin/init.sh

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for EPD-7.1-2
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin:${PATH}"
export PATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

