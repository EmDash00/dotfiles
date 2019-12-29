set number
set expandtab
set noshowmode

set backspace=2
set laststatus=2
set tabstop=3
set shiftwidth=3

set termguicolors
set background=dark

set clipboard=unnamedplus

call plug#begin(stdpath('data') . '/plugged')
   "-----------------Utility-----------------
   Plug 'w0rp/ale'
   Plug 'junegunn/fzf.vim'
   Plug 'tpope/vim-fugitive'
   Plug 'tpope/vim-eunuch'
   Plug 'scrooloose/nerdcommenter'
   Plug 'terryma/vim-multiple-cursors'
   Plug 'christoomey/vim-tmux-navigator'
   Plug 'scrooloose/nerdtree'
   Plug 'SirVer/ultisnips'
      Plug 'honza/vim-snippets'
   Plug 'Valloric/YouCompleteMe' "Depracated. TODO: Replace with deoplete
   Plug 'godlygeek/tabular'

   
   "------------Language Specific-----------
   Plug 'tmhedberg/SimpylFold'
   Plug 'vim-scripts/indentpython.vim'


   "---------------Appearance---------------
   Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'


   "---------------Syntatical---------------
   Plug 'PotatoesMaster/i3-vim-syntax'

   Plug 'dbeniamine/todo.txt-vim'
   Plug 'plasticboy/vim-markdown'
   Plug 'sheerun/vim-polyglot'

   "--------------Colorschemes--------------
   Plug 'ayu-theme/ayu-vim'
   Plug 'fatih/molokai'
   Plug 'kristijanhusak/vim-hybrid-material'
   Plug 'sickill/vim-monokai'
   Plug 'joshdick/onedark.vim'
   Plug 'rakr/vim-one'
call plug#end()

colorscheme one


if filereadable(stdpath('config') . '/keybinds.vim') 
   source $XDG_CONFIG_HOME/nvim/keybinds.vim
endif

if filereadable(stdpath('config') . '/matches.vim')
   source $XDG_CONFIG_HOME/nvim/matches.vim
endif

if filereadable(stdpath('config') . '/plugopts.vim')
   source $XDG_CONFIG_HOME/nvim/plugopts.vim
endif

if filereadable(stdpath('config') . '/functions.vim')
   source $XDG_CONFIG_HOME/nvim/autofuncs.vim
endif
