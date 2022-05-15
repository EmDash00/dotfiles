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

# Append variables to path if they're not already in it and if they're valid directories
path_append()
{
   if [ "$#" -eq 0 ]; then
      echo "usage: path_append DIR1 DIR2 DIR3"
      return 1
   else
      for arg in "$@"; do
         if [ -d "${arg:+$arg/}" ] ; then
            if [[ ! ${PATH} =~ ${arg} ]] ; then
               PATH="${PATH}:${arg}" 
            fi
         else
            echo "Path $arg does not exist. Skipping..."
         fi
      done
   fi
}

path_prepend()
{
   if [ "$#" -eq 0 ]; then
      echo "usage: path_append DIR1 DIR2 DIR3"
      return 1
   else
      for arg in "$@"; do
         if [ -d "${arg:+$arg/}" ] ; then
            if [[ ! ${PATH} =~ ${arg} ]] ; then
               PATH="${arg}:${PATH}" 
            fi
         else
            echo "Path $arg does not exist. Skipping..."
         fi
      done
   fi
}


#path_append "$HOME/bin"

export PYENV_ROOT="$HOME/.pyenv"
export DUB_HOME="$HOME/.dub/packages"
export APPS="$HOME/Apps"

export H3D_ROOT="/usr/local/share/h3dapi"

export LD_LIBRARY_PATH='/usr/local/lib'

export XDG_CONFIG_HOME='/home/emdash00/.config'
export XDG_DATA_HOME='/home/emdash00/.local/share'

export NVIM_CONF="${XDG_CONFIG_HOME}/nvim"
export ZSH_CONF="${XDG_CONFIG_HOME}/zsh"
export I3_CONF="${XDG_CONFIG_HOME}/i3"
export ZPLUG_HOME="${XDG_CONFIG_HOME}/zplug"

export ROS_HOME="$HOME/.config/ros"

export PYTHONPATH="${PYTHONPATH}:/home/emdash00/Documents/Work/Rothlab/lib/SILKOWRM"
export PYTHONPATH="${PYTHONPATH}:/home/emdash00/Documents/Work/Rothlab/lib/forcedimension-python"
export PYTHONPATH="${PYTHONPATH}:/home/emdash00/Documents/Work/Rothlab/lib/immutable"
export VIRTUALENVWRAPPER_PYTHON=`which python3`
export SUDO_ASKPASS='/usr/lib/ssh/x11-ssh-askpass'

#path_append "$HOME/.platformio/penv/bin"
path_prepend "$PYENV_ROOT/bin"
path_prepend "$PYENV_ROOT/shims"


path_append "/usr/local/bin"
path_append "$HOME/.local/bin"
path_append "$HOME/Apps/AppImage"
path_append "$HOME/Apps/source/pplatex-pplatex-1.0-rc2/build/src"
#path_append "/tools/Xilinx/Vivado/2020.2/bin"
path_append "$HOME/Apps/source/clion-2021.1.2/bin"
path_append "$HOME/Apps/source/arduino-cli_0.18.3_Linux_64bit"


path_append "$DUB_HOME/dcd-0.12.0/dcd/bin"
path_append "$DUB_HOME/dfix-0.3.5/dfix"
path_append "$DUB_HOME/dfmt-0.11.0/dfmt/bin"
path_append "$DUB_HOME/dscanner-0.8.0/dscanner/bin"


export PATH="$PATH"
. "$HOME/.cargo/env"
