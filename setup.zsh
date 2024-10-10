#!/usr/bin/env zsh 
echo $ZSH_VERSION

# Install  Homebrew. Homebrew  is the equivalent of apt-get for linux. Its required to install tools such as git and wget.
# Mac OS 10.9 will automatically prompt user to install XCode command line tools which is a pre-requisite.
which brew 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo >> /Users/jlim/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jlim/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
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

# Install python (comes with Setuptools and pip)
brew install python
 
# Install IntelliJ Ulitmate
brew install --cask intellij-idea

# Install Raycast 
brew install --cask raycast

# Install xmind for mind mapping 
brew install --cask xmind

# Install Zoom.us
#brew install --cask zoomus

# Install Chrome
#brew install --cask google-chrome

# Install postman
brew install --cask postman

# Install reflector 
brew install --cask reflector

# Install github command line tool 
brew install gh

# Install node version manager 

if ! brew info nvm &>/dev/null; then
  #: Do something because cask is not installed
  brew install nvm
  export NVM_DIR="$HOME/.nvm"
  echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zprofile # This loads nvm
  echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.zprofile  # This loads nvm bash_completion 
else
  #: Do something when cask is installed
  echo 'NVM already installed'
fi

# Install dotfiles
DOTFILES_REMOTE='https://github.com/johnlim/dotfiles.git' 
DOTFILES_LOCAL=~/git/dotfiles
git clone $DOTFILES_REMOTE $DOTFILES_LOCAL 
chmod +x $DOTFILES_LOCAL/setup.sh
$DOTFILES_LOCAL/setup.sh

#install NVM (Node Version Manager) - the script adds the source line to your prfile (~/bash_profile etc) so pls install dotfiles first.
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
#source $HOME/.bash_profile
nvm install node

#increase key repeat rate
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write NSGlobalDomain KeyRepeat -int 1
