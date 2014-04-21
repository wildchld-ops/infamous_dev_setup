#!/bin/bash
#
# Author: mrimp
#
# Description:
# Setup script for the Build Enviroment Ubuntu 13.10
#
# Legal Stuff:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>
#
echo "Ubuntu 14.04"
echo "Replace openjdk with Oracle java6"
sleep 2
echo "Enter in your password"
sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\* -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update 
sudo apt-get install oracle-java6-installer -y
sudo update-java-alternatives -s java-6-oracle
sudo apt-get install oracle-java6-set-default
echo ""
java -version
echo "Done"
echo "Adding Webupd8 ppa for android tools"
sleep 2
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo apt-get update
sudo apt-get install android-tools-adb android-tools-fastboot
echo "Done"
echo "Create bin directory and getting repo"
sleep 2
rm -rf ~/bin/repo
rm -rf ~/.repoconfig
mkdir ~/bin 
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
echo "Done"
echo "Installing packages"
sleep 2
sudo apt-get install git gnupg ccache lzop flex bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 libc6-dev lib32bz2-1.0 lib32ncurses5-dev x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 lib32z1-dev libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc libreadline6-dev lib32readline-gplv2-dev libncurses5-dev bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev lib32bz2-dev squashfs-tools pngcrush schedtool dpkg-dev
echo "Done"
echo "Linking..."
sleep 2
sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
echo "Done"
echo "Adding bin directory to path"
sleep 2
echo 'export PATH=$PATH:~/bin' >> ~/.bashrc
source ~/.bashrc
echo "Done"

