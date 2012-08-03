git pull
echo "Installing dot files"

D=`pwd`
ln -Fs ${D}/bash_profile ../.bash_profile
ln -Fs ${D}/bashrc ../.bashrc
ln -Fs ${D}/aliases ../.aliases
ln -Fs ${D}/vimrc ../.vimrc
ln -Fs ${D}/gvimrc ../.gvimrc
ln -Fs ${D}/pandoc ../.pandoc
ln -Fs ${D}/janus.rake ../.janus.rake
ln -Fs ${D}/apple ../.osx

