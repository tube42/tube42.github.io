#!/bin/sh
# development stuff

# install minimal stuff
sudo apt-get install --no-install-recommends -y gcc g++ golang python 
sudo apt-get install --no-install-recommends -y git emacs subversion ant


# temporary structure and files
mkdir ${HOME}/repos
mkdir ${HOME}/build


# configure git with crap
git config --global user.email "???"
git config --global user.name "???"


# for local stuff:
# git config --local user.email "av@tube42.se"
# git config --local user.name "Tubeman, The"

