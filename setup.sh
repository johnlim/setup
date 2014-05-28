#!/bin/bash
# Install  Homebrew. Homebrew  is the equivalent of apt-get for linux. Its required to install tools such as git and wget.
# Mac OS 10.9 will automatically prompt user to install XCode command line tools which is a pre-requisite.
which brew 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew update
fi

# Install Git
brew list | grep git
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
  brew install git
fi

# Install kdiff3 & set it as the default external  diff/merge too for git
brew list | grep kdiff3
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
  brew install kdiff3
fi
git config --global diff.tool kdiff3
git config --global merge.tool kdiff3

# Install groovy
brew list | grep groovy 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
  brew install groovy
fi

# Install Grails
brew list | grep grails
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
  brew install grails
fi

# Install Gradle
brew list | grep gradle
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
  brew install gradle
fi

# Install Homebrew-cask. A CLI workflow for the adminisration of Mac applications distributed as binaries http://caskroom.io
brew tap caskroom/cask
brew install brew-cask

# install JDK 1.7.0_51 for Grails and IntelliJ compatibality reasons
brew tap caskroom/versions
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-versions
git checkout c33b05890073200829b33859f0a5ab325f34f370
brew cask install java7
git checkout HEAD

# Install IntelliJ Ulitmate
brew cask list | grep intellij-idea
RETSTATUS=$?
if [ RETSTATUS -ne 0 ]
  brew cask install intellij-idea
fi

# Install Alfred
brew cask list | grep alfred 
RETSTATUS=$?
if [ RETSTATUS -ne 0 ]
  brew cask install alfred
fi
# Run "brew cask alfred link" after starting Alfred to enable Alfred to search Caskroom
brew cask alfred link

# Install SequelPro
brew cask list | grep sequel-pro 
RETSTATUS=$?
if [ RETSTATUS -ne 0 ]
  brew cask install sequel-pro
fi

# Install Homesick. Dotfiles manager. 
#gem install homesick
