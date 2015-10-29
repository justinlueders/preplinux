#!/bin/bash
update-alternatives --config editor
echo 'set -o vi' >> ~/.bashrc
echo "alias d='/usr/bin/docker'" >> ~/.bashrc
echo "alias f='~/firmament/firmament.js'" >> ~/.bashrc
echo 'set nu' >> ~/.vimrc
#Continuous integration so bower won't ask for statistics
export CI=true
