#!/bin/bash
# Install  Homebrew. Homebrew  is the equivalent of apt-get for linux. Its required to install tools such as git and wget.
# Mac OS 10.9 will automatically prompt user to install XCode command line tools which is a pre-requisite.
which brew 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
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
else
  tput setaf 1 && tput smul
  echo Warning:
  tput sgr0
  echo kdiff3 already installed.
fi

# Install groovy
brew install groovy

# Install Grails
brew install grails

# Install Gradle
brew install gradle

# Install Homebrew-cask. A CLI workflow for the adminisration of Mac applications distributed as binaries http://caskroom.io
echo Tapping caskroom/cask...
brew tap caskroom/cask
brew install brew-cask

# install JDK 1.7.0_51 for Grails and IntelliJ compatibality reasons
brew cask list | grep java7 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  echo Tapping caskroom/versions...
  brew tap caskroom/versions
  cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-versions
  git checkout c33b05890073200829b33859f0a5ab325f34f370
  brew cask install java7
  git checkout master
else
  tput setaf 1 && tput smul
  echo Warning:
  tput sgr0
  echo java7 already installed.
fi

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
# Install Homesick. Dotfiles manager. 
#gem install homesick
