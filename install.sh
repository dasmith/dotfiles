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
ln -Fs ${D}/matplotlibrc ../.matplotlibrc
ln -Fs ${D}/apple ../.osx
ln -Fs ${D}ipython_config.py ../.ipython/profile_default/ipython_config.py
cd powerline-bash; git pull; cd ..
ln -Fs powerline-bash/powerline-bash.py powerline-bash.py
git clone -q https://github.com/milkbikis/powerline-bash


