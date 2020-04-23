# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -n $IMPORTED ]; then
   export PATH=$PATH:~/.platformio/penv/bin


   export PATH=$PATH:/usr/local/bin

   export DUB_HOME="/home/emdash00/.dub/packages"

   export PATH=$PATH:$DUB_HOME/dcd-0.12.0/dcd/bin/:$DUB_HOME/dfix-0.3.5/dfix:$DUB_HOME/dfmt-0.11.0/dfmt/bin:$DUB_HOME/dscanner-0.8.0/dscanner/bin


   export PYTHONPATH="${PYTHONPATH}:/home/emdash00/Documents/Work/Rothlab/lib/SILKOWRM"
   export APPS="$HOME/Apps"

   export XDG_CONFIG_HOME='/home/emdash00/.config'
   export XDG_DATA_HOME='/home/emdash00/.local/share'
   export LD_LIBRARY_PATH='/usr/local/lib'
   export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

   export IMPORTED="true"

fi


eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
