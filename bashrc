# Bash settings for Dustin Smith

export CLICOLOR=1;
# See following for more information: http://www.infinitered.com/blog/?p=10

export IKARUS_LIBRARY_PATH=.:/Users/dustin/Documents/Projects/Others/mit-church:IKARUS_LIBRARY_PATH
export JAVA_OPTS="$JAVA_OPTS -Dsolr.solr.home=/usr/local/tomcat6/solr"

# Identify OS and Machine -----------------------------------------
export OS=`uname -s | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export OSVERSION=`uname -r`; OSVERSION=`expr "$OSVERSION" : '[^0-9]*\([0-9]*\.[0-9]*\)'`
export MACHINE=`uname -m | sed -e 's/  */-/g;y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
export PLATFORM="$MACHINE-$OS-$OSVERSION"
export THISHOST=$(hostname -f)

function parse_git_dirty {
[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export TEXTMF=/usr/local/texlive/2011/texmf/

# path using powerline-bash
function _update_ps1() { 
  export PS1="$(~/dotfiles/powerline-shell.py $?)" 
}
function _update_ps1_host() { 
  export PS1="$THISHOST:$(~/dotfiles/powerline-shell.py $?)" 
}
function _update_ps1_user() { 
 export PS1="$(whoami):$(~/dotfiles/powerline-shell.py $?)"
}
function _update_ps1_host_user() {
  export PS1="$(whoami)@$THISHOST:$(~/dotfiles/powerline-shell.py $?)"
}
export PROMPT_COMMAND="_update_ps1"

if [ $THISHOST = "UTM" -o $THISHOST = "Turing" ]; then 
  #alias eclim='/Applications/eclipse/eclimd'
  export ARCHFLAGS='-arch x86_64'
  export JAVA_HOME="/usr/lib/jvm/java-6-sun"
  PANDA_VERSION=1.7
  PANDA_PATH=/Developer/Panda3d/lib
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
  #source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
  export PATH=/Developer/Tools/Panda3d/bin:/usr/local/bin/:$PATH:/Users/dustin/.vim/scmindent:$HOME/Library/Haskell/bin
  export PATH=$PATH:/usr/local/flex_sdk_4.6/bin/
  export PATH=$PATH:/usr/local/Cellar/ruby/1.9.3-p286/bin
  export FLEX_HOME=/usr/local/flex_sdk_4.6/
  export PATH=/Applications/MATLAB_R2008a/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/:/opt/local/lib/mysql5/bin:/opt/local/bin:~/MonetDb/etc:~/MonetDb/include:~/MonetDb/share:~/Monetdb/var:~/MonetDb/lib:/Users/dustin/MonetDb/bin:/opt/local/sbin:/usr/local/android-sdk-mac_x86-1.5_r1:/opt/local/bin:/Users/dustin/.cabal/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH
else
  export PATH=$PATH:/home/dustin/google_appengine/
  export PROMPT_COMMAND=$PROMPT_COMMAND"_host"
fi

# add username to the prompt if not dustin
if [ "$(whoami)" != "dustin" ]; then
    export PROMPT_COMMAND=$PROMPT_COMMAND"_user"
fi


if [ $THISHOST = "abbith.media.mit.edu" ] ||  [ $THISHOST = "UTM" ]; then
  # Amazon and Star Cluster stuff
  export AWS_HOME=~/.aws
  #source $AWS_HOME/config
  #export PATH=$PATH:$AWS_HOME/bin
  # elasticbeanstalk.us-east-1.amazonaws.com
  # add Elastic Beanstalk 
  export PATH=$PATH:$AWS_HOME/eb/linux/python2.7/
  #export EC2_PRIVATE_KEY=`ls $AWS_HOME/pk-*.pem`
  #export EC2_CERT=`ls $AWS_HOME/cert-*.pem`
  #export PATH=$PATH:$AWS_HOME/bin
fi

# gem dir
export PATH=/usr/local/texlive/2011/bin/x86_64-darwin:$PATH:/usr/local/Cellar/ruby/1.9.2-p180/bin

# Load in .bashrc -------------------------------------------------
source ~/.aliases   
# virtualenvwrapper

export GOOGLE_APP_ENGINE=/Applications/GoogleAppEngineLauncher.app/Contents/Resources/GoogleAppEngine-default.bundle/Contents/Resources/google_appengine/

export PYTHONPATH=$GOOGLE_APP_ENGINE:/Developer/Panda3d/lib:/Developer/Panda3d/lib/Users/dustin/Documents/Projects/event-ui/server/:/Users/dustin/Documents/Projects/event-ui/server/nlplanners:/Users/dustin/Documents/Projects/Others/scin/scin/:/Users/dustin/Documents/Projects/goals/:/Users/dustin/.py-dustin/:/Users/dustin/Documents/Projects/py-dustin/:/Users/dustin/Documents/Projects/divisi2:/Library/Frameworks/Python.framework/Versions/Current/lib/python2.7/site-packages:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/:/Users/dustin/Documents/Projects/nlplanners:/Users/dustin/Documents/Projects/Others/scin/scin/:/Users/dustin/Documents/Projects/goals/:/Users/dustin/.py-dustin/:/Users/dustin/Documents/Projects/py-dustin/:/Users/dustin/Documents/Projects/divisi2:/Library/Frameworks/Python.framework/Versions/Current/lib/python2.7/site-packages:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/:/Users/dustin
export PYTHONPATH=$PYTHONPATH:/home/dustin/google_appengine/:/Users/dustin/Documents/Projects/beansprock/beansprock-algorithm

export PATH=/Volumes/Tape/QT5/5.0.0-rc1/clang_64/bin/:/usr/local/bin/:$PATH
export PIP_RESPECT_VIRTUALENV=true
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/Users/dustin/Library/Enthought/Canopy_64bit/User/bin/virtualenvwrapper.sh
source /Users/dustin/Library/Enthought/Canopy_64bit/User/bin/virtualenvwrapper.sh


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
