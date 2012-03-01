#!/bin/bash
git clone git://github.com/b4winckler/macvim.git
cd macvim/src
export LDFLAGS=-L/usr/lib
./configure --with-features=huge --enable-rubyinterp --enable-perlinterp --enable-cscope --enable-multibyte --enable-pythoninterp --with-python-config-dir=/Library/Frameworks/EPD64.framework/Versions/Current/lib/python2.7/config/
make
open MacVim/build/Release
echo Drag MacVim.app to your Applications directory