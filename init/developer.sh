#!/bin/sh
# base development stuff

# needed packages:
sudo apt-get install --no-install-recommends -y gcc g++ golang python 
sudo apt-get install --no-install-recommends -y make git subversion
# sudo apt-get install --no-install-recommends -y emacs


# structure
mkdir ${HOME}/repos
mkdir ${HOME}/build


# configure git with crap

# global
# git config --global user.email "???"
# git config --global user.name "???"
#
# use this for local stuff:
# git config --local user.email "av@tube42.se"
# git config --local user.name "Tubeman, The"


# get Linus' microemacs
sudo apt-get install --no-install-recommends -y ncurses-dev
pushd .
cd ${HOME}/build
git clone git://git.kernel.org/pub/scm/editors/uemacs/uemacs.git
cd uemacs
make
sudo make install
popd


# get jasspa microemacs
pushd .
bash << EOF
mkdir -p $HOME/build/microemacs
cd $HOME/build/microemacs
wget http://www.jasspa.com/release_20090909/jasspa-mesrc-20091011.tar.gz
wget http://www.jasspa.com/release_20090909/jasspa-metree-20091017.tar.gz
tar xzf jasspa-mesrc-20091011.tar.gz
tar xzf jasspa-metree-20091017.tar.gz
cd me091011/src/
./build

cd ../..
cp me091011/src/mec jasspa/me
cp me091011/src/mew jasspa/me
cp me091011/src/me jasspa/
sudo mv jasspa /opt/microemacs
EOF
popd

cat << EOF >> $HOME/.bashrc
# for microemacs
export PATH=\$PATH:/opt/microemacs
EOF
