#!/bin/bash
# Setting up Android Build Enviroment Ubuntu 13.04
echo "Replace openjdk with Oracle java6"
sleep 2
echo "Enter in your password"
sudo apt-get purge openjdk-\* icedtea-\* icedtea6-\* -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update && sudo apt-get install oracle-java6-installer -y
sudo update-java-alternatives -s java-6-oracle
sudo apt-get install oracle-java6-set-default
echo ""
java -version
echo "Done"
echo "Adding Webupd8 ppa for android tools"
sleep 2
sudo add-apt-repository ppa:nilarimogard/webupd8 -y
sudo apt-get update && sudo apt-get install android-tools-adb android-tools-fastboot
echo "Done"
echo "Create bin directory and getting repo"
sleep 2
mkdir ~/bin && curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo && chmod a+x ~/bin/repo
chmod a+x ~/bin/repo
echo "Done"
echo "Installing packages"
sleep 2
sudo apt-get -y install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev zlib1g-dev:i386 libc6-dev lib32ncurses5-dev ia32-libs x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 lib32z-dev libgl1-mesa-glx:i386 libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc readline-common libreadline6-dev libreadline6 lib32readline-gplv2-dev libncurses5-dev lib32readline5 lib32readline6 libreadline-dev libreadline6-dev:i386 libreadline6:i386 bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev lib32bz2-dev libsdl1.2-dev libesd0-dev squashfs-tools pngcrush schedtool libwxgtk2.8-dev python
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
# Moving below to a aokp_build.sh
