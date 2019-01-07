#!/bin/bash
# Install  Homebrew. Homebrew  is the equivalent of apt-get for linux. Its required to install tools such as git and wget.
# Mac OS 10.9 will automatically prompt user to install XCode command line tools which is a pre-requisite.
which brew 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  tput setaf 1 && tput smul
  echo Warning:
  tput sgr0
  echo Homebrew already installed.
  echo Updating formulae and homebrew itself.....
  (set -x; brew update;) 
fi

#Homebrew will show warning message if already installed.  
#Install Vim
brew install vim

# Install Git
brew install git
git config --global pull.rebase true

# Install kdiff3 & set it as the default external  diff/merge too for git
brew list | grep kdiff3
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  brew cask install kdiff3
  git config --global diff.tool kdiff3
  git config --global merge.tool kdiff3
  git config --global core.editor "/usr/local/bin/vim"
else
  tput setaf 1 && tput smul
  echo Warning:
  tput sgr0
  echo kdiff3 already installed.
fi

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java

# Install G* tools
sdk install groovy

# Install wget
brew install wget

# Install python (comes with Setuptools and pip)
brew install python 

# Install IntelliJ Ulitmate
brew cask install intellij-idea

# Install Alfred
brew cask install alfred 

# Install SequelPro
brew cask install sequel-pro

# Install Skype
brew cask install skype

# Install Chrome
brew cask install google-chrome

# Install Chrome
brew cask install spectacle 

# Install dotfiles
DOTFILES_REMOTE='https://github.com/johnlim/dotfiles.git' 
DOTFILES_LOCAL=~/git/dotfiles
git clone $DOTFILES_REMOTE $DOTFILES_LOCAL 
chmod +x $DOTFILES_LOCAL/setup.sh
$DOTFILES_LOCAL/setup.sh

#install NVM (Node Version Manager) - the script adds the source line to your prfile (~/bash_profile etc) so pls install dotfiles first.
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source $HOME/.bash_profile
nvm install node

