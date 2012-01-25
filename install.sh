git pull
echo "Installing dot files"

D=`pwd`
ln -Fs ${D}/bash_profile ../.bash_profile
ln -Fs ${D}/bashrc ../.bashrc
ln -Fs ${D}/aliases ../.aliases
ln -Fs ${D}/vimrc.before ../.vimrc.before
ln -Fs ${D}/pandoc ../.pandoc
ln -Fs ${D}/janus.rake ../.janus.rake

