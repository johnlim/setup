#!/usr/bin/env bash
echo $BASH_VERSION

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

# Install latest Bash so that we get programmable compeltions
brew list | grep bash
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  brew install bash
  echo "Whitelisting new bash shell..."
  echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/bash
  echo "Make it default for root user"
  sudo chsh -s /usr/local/bin/bash
else
  tput setaf 1 && tput smul
  echo Warning:
  tput sgr0
  echo bash already installed.
fi

# Install bash completions
brew install bash-completion@2
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > /usr/local/etc/bash_completion.d/git-completion.bash


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

# Install mkcert for securing local dev
brew install mkcert

# Install IntelliJ Ulitmate
brew cask install intellij-idea

# Install Alfred
brew cask install alfred 

# Install SequelPro
brew cask install sequel-pro

# Install Zoom.us
brew cask install zoomus

# Install Chrome
brew cask install google-chrome

# Install Chrome
brew cask install spectacle 

# Install postman
brew cask install postman

# Install postman
brew cask install reflector

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

#increase key repeat rate
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write NSGlobalDomain KeyRepeat -int 1
