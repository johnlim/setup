#!/bin/bash
# Install  Homebrew. Homebrew  is the equivalent of apt-get for linux. Its required to install tools such as git and wget.
# Mac OS 10.9 will automatically prompt user to install XCode command line tools which is a pre-requisite.
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Install Git
brew install git

# Install groovy
brew install groovy

# Install Grails
brew install grails

# Install Gradle
brew install gradle

# Install kdiff3 & set it as the default external  diff/merge too for git
brew install kdiff3
git config --global diff.tool kdiff3
git config --global merge.tool kdiff3

# Install Homebrew-cask. A CLI workflow for the adminisration of Mac applications distributed as binaries http://caskroom.io
brew tap phinze/cask
brew install brew-cask

# Install Java SDK
brew cask install java

# Install IntelliJ Ulitmate
brew cask install intellij-idea

# Install Alfred
brew cask install alfred
# Run "brew cask alfred link" after starting Alfred to enable Alfred to search Caskroom

# Install SequelPro
brew cask install sequel-pro

# Update all installs
brew update && brew upgrade && brew cleanup

# Install Homesick. Dotfiles manager. 
gem install homesick
