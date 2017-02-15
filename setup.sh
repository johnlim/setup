#!/bin/bash
# Install dotfiles
DOTFILES_REMOTE='https://github.com/johnlim/dotfiles.git' 
DOTFILES_LOCAL=~/git/dotfiles
git clone $DOTFILES_REMOTE $DOTFILES_LOCAL 
chmod +x $DOTFILES_LOCAL/setup.sh
$DOTFILES_LOCAL/setup.sh

#install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
source $HOME/.bash_profile

#install bower, grunt-cli, browserify and gulp 
npm install -g bower
npm install -g grunt-cli
npm install -g browserify
npm install -g gulp

# Install  Homebrew. Homebrew  is the equivalent of apt-get for linux. Its required to install tools such as git and wget.
# Mac OS 10.9 will automatically prompt user to install XCode command line tools which is a pre-requisite.
which brew 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  tput setaf 1 && tput smul
  echo Warning:
  tput sgr0
  echo Homebrew already installed.
  echo Upgrading brew casks.....
  #http://apple.stackexchange.com/questions/190072/is-there-any-way-to-upgrade-brew-caski
  # one-liner equivalent = curl -s https://gist.githubusercontent.com/atais/9c72e469b1cbec35c7c430ce03de2a6b/raw/36808a0544628398f26b48f7a3c7b309872ca2c6/cask_upgrade.sh | bash /dev/stdin 
  (set -x; brew update;)

  (set -x; brew cleanup;)
  (set -x; brew cask cleanup;)

  red=`tput setaf 1`
  green=`tput setaf 2`
  reset=`tput sgr0`

  casks=( $(brew cask list) )

  for cask in ${casks[@]}
  do
    version=$(brew cask info $cask | sed -n "s/$cask:\ \(.*\)/\1/p")
    installed=$(find "/usr/local/Caskroom/$cask" -type d -maxdepth 1 -maxdepth 1 -name "$version") 
    if [[ -z $installed ]]; then
      echo "${red}${cask}${reset} requires ${red}update${reset}."
      (set -x; brew cask uninstall $cask --force;)
      (set -x; brew cask install $cask --force;)
    else
      echo "${red}${cask}${reset} is ${green}up-to-date${reset}."
    fi
  done
fi

#Homebrew will show warning message if already installed.  
#Install Vim
brew install vim

# Install Git
brew install git

# Install kdiff3 & set it as the default external  diff/merge too for git
brew list | grep kdiff3
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  brew install kdiff3
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
curl -s get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java

# Install G* tools
sdk install groovy
sdk install grails
sdk install gradle

# Install wget
brew install wget

# Install python (comes with Setuptools and pip)
brew install python 

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

# Install IntelliJ Ulitmate
brew cask install intellij-idea

# Install Alfred
brew cask list | grep alfred 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  brew cask install alfred 
  brew cask alfred 
else
  brew cask install alfred #use brew casks' warning message
fi

# Install SequelPro
brew cask install sequel-pro

# Install Skype
brew cask install skype

# Install Chrome
brew cask install google-chrome

