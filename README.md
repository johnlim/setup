setup
=====
This script automates the setting up of my Mac enviroment.  
To use this script, download this file to your local directory and execute
```
$ chmod +x setup.zsh
$ ./setup.zsh
```

Troubleshooting
=====
If the following error is encountered while installing Xcode Command Line Tools 
```
Can’t install the software because it is not currently available from the Software Update server
```
please download and install Xcode Command Line Tools manually from developer.apple.com/downloads/

If key repeat settings like the below are not taking effect

```defaults write -g KeyRepeat -int 1`` 
please note the following:
``` 
Terminal's Permissions: In recent macOS versions, applications, including Terminal, require explicit permission to access certain system areas. Ensure that Terminal (and potentially the shell you are using, like Bash or Zsh) has "Full Disk Access" enabled in System Settings > Privacy & Security > Full Disk Access.
```
