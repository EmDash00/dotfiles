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

export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/Cellar/imagemagick/7.1.1-28/lib/pkgconfig:$PKG_CONFIG_PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PIPENV_PYTHON="$PYENV_ROOT/shims/python"
export DUB_HOME="$HOME/.dub/packages"
export APPS="$HOME/Apps"

#export LD_LIBRARY_PATH='/usr/local/lib'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export NVIM_CONF="${XDG_CONFIG_HOME}/nvim"
export ZSH_CONF="${XDG_CONFIG_HOME}/zsh"
export I3_CONF="${XDG_CONFIG_HOME}/i3"
export ZPLUG_HOME="${XDG_CONFIG_HOME}/zplug"

export ROS_HOME="$HOME/.config/ros"

export VIRTUALENVWRAPPER_PYTHON=`which python3`
export POETRY_VIRTUALENVS_IN_PROJECT="true"
export POETRY_VIRTUALENVS_PATH=".venv"

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

#path_append "$HOME/.platformio/penv/bin"
path_prepend "$HOME/.local/bin"
path_append /opt/cuda/bin

. "$HOME/.cargo/env"

. "$HOME/.local/share/../bin/env"
. "/home/daydream/.deno/env"