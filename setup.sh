#!/bin/bash
# Install  Homebrew. Homebrew  is the equivalent of apt-get for linux. Its required to install tools such as git and wget.
# Mac OS 10.9 will automatically prompt user to install XCode command line tools which is a pre-requisite.
which brew 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
else
  tput setaf 1 && tput smul
  echo Warning:
  tput sgr0
  echo Homebrew already installed.
fi

# Install Git
brew install git #Homebrew will show warning message if already installed.

# Install kdiff3 & set it as the default external  diff/merge too for git
brew list | grep kdiff3
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  brew install kdiff3
  git config --global diff.tool kdiff3 
  git config --global merge.tool kdiff3
  git config --global core.editor "/usr/bin/vim"
else
  tput setaf 1 && tput smul
  echo Warning:
  tput sgr0
  echo kdiff3 already installed.
fi

#Install Vim
brew install vim

# Install SDKMAN
curl -s http://get.sdkman.io | bash
export SDKMAN_DIR="/Users/$USER/.sdkman" && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"

# Install G* tools
sdk install groovy
sdk install grails
sdk install gradle

# Install wget
brew install wget

# Install python (comes with Setuptools and pip)
brew install python 

#install nodeJs, bower, grunt-cli and browserify
brew install node
npm install -g bower
npm install -g grunt-cli
npm install -g browserify

#install automake
brew install automake

#install libtool
brew install libtool 

#install ruby
brew install ruby
gem install jekyll
gem install compass

# Install Homebrew-cask. A CLI workflow for the adminisration of Mac applications distributed as binaries http://caskroom.io
echo Tapping caskroom/cask...
brew tap caskroom/cask
brew install brew-cask

# install JDK 1.6x for IntelliJ compatibality reasons
brew cask install java7

# Install IntelliJ Ulitmate
brew cask install intellij-idea

# Install Alfred
brew cask list | grep alfred 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  brew cask install alfred 
  # Run "brew cask alfred link" after starting Alfred to enable Alfred to search Caskroom
  open -a ~/Applications/Alfred\ 2.app
  sleep 5
  brew cask alfred link
else
  brew cask install alfred #use brew casks' warning message
fi

# Install SequelPro
brew cask install sequel-pro

# Install Skype
brew cask install skype

# Install Chrome
brew cask install google-chrome

# Install dotfiles
DOTFILES_REMOTE='https://github.com/johnlim/dotfiles.git' 
DOTFILES_LOCAL=~/git/dotfiles
git clone $DOTFILES_REMOTE $DOTFILES_LOCAL 
chmod +x $DOTFILES_LOCAL/setup.sh
$DOTFILES_LOCAL/setup.sh
