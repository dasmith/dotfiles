# Bash settings for Dustin Smith

export CLICOLOR=1;
# See following for more information: http://www.infinitered.com/blog/?p=10

export IKARUS_LIBRARY_PATH=.:/Users/dustin/Documents/Projects/Others/mit-church:IKARUS_LIBRARY_PATH
export JAVA_OPTS="$JAVA_OPTS -Dsolr.solr.home=/usr/local/tomcat6/solr"

PS1='\[\033k\033\\\]\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
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

if [ $THISHOST = "UTM" ]; then 
  #alias eclim='/Applications/eclipse/eclimd'
  export ARCHFLAGS='-arch x86_64'
  export JAVA_HOME="/usr/lib/jvm/java-6-sun"
  PANDA_VERSION=1.7
  PANDA_PATH=/Developer/Panda3d/lib
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
  #source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh
  export PATH=/Developer/Tools/Panda3d/bin:/usr/local/bin/:$PATH:/Users/dustin/.vim/scmindent:$HOME/Library/Haskell/bin
  source /Users/dustin/Documents/Projects/Others/StarCluster/completion/starcluster-completion.sh
  export PATH=/Applications/MATLAB_R2008a/bin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/:/opt/local/lib/mysql5/bin:/opt/local/bin:~/MonetDb/etc:~/MonetDb/include:~/MonetDb/share:~/Monetdb/var:~/MonetDb/lib:/Users/dustin/MonetDb/bin:/opt/local/sbin:/usr/local/android-sdk-mac_x86-1.5_r1:/opt/local/bin:/Users/dustin/.cabal/bin:/opt/local/sbin:/Library/Frameworks/Python.framework/Versions/Current/bin:$PATH
  export PS1='\[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ ' # no hostname
else
  export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
fi

if [ $THISHOST = "abbith.media.mit.edu" ] ||  [ $THISHOST = "UTM" ]; then
  # Amazon and Start Cluster stuff
  export EC2_HOME=~/.ec2
  source $EC2_HOME/config
  export PATH=$PATH:$EC2_HOME/bin
  export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
  export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
  export PATH=$PATH:$EC2_HOME/bin
elif [ $THISHOST = "intern04" ]; then
  source ~/aliases.nokia
fi
     
# Load in .bashrc -------------------------------------------------
source ~/.aliases   

export PIP_RESPECT_VIRTUALENV=true
export WORKON_HOME=/Users/dustin/py
