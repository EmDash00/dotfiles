set number
set expandtab
set noshowmode

set backspace=2
set laststatus=2
set tabstop=3
set shiftwidth=3

set termguicolors
set background=dark

"Vim clipboard is the system clipboard
set clipboard=unnamedplus

"Blinking cursor
let NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set guicursor=a:blinkwait700-blinkon400-blinkoff250

call plug#begin(stdpath('data') . '/plugged')
   "----------------Completion---------------
   
   Plug 'w0rp/ale'
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
      "Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
      Plug 'Shougo/deoplete-clangx'
      Plug 'autozimu/LanguageClient-neovim', {
       \ 'branch': 'next',
       \ 'do': 'bash install.sh',
       \ }
      Plug 'deoplete-plugins/deoplete-tag'
      Plug 'Shougo/neco-syntax'
      Plug 'deoplete-plugins/deoplete-jedi'
      Plug 'Shougo/neco-vim'
      Plug 'Shougo/neoinclude.vim'
      Plug 'deoplete-plugins/deoplete-zsh'

   Plug 'junegunn/fzf.vim'
      Plug 'SirVer/ultisnips'
      Plug 'honza/vim-snippets'

   "-----------------Utility-----------------
   Plug 'smitajit/bufutils.vim'
   Plug 'tpope/vim-fugitive'
   Plug 'tpope/vim-eunuch'
   Plug 'scrooloose/nerdcommenter'
   Plug 'terryma/vim-multiple-cursors'
   Plug 'christoomey/vim-tmux-navigator'
   Plug 'scrooloose/nerdtree'
   Plug 'godlygeek/tabular'

   
   "------------Language Specific-----------
   Plug 'tmhedberg/SimpylFold'
   Plug 'vim-scripts/indentpython.vim'


   "---------------Appearance---------------
   Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'


   "---------------Syntatical---------------
   Plug 'PotatoesMaster/i3-vim-syntax'
   Plug 'scarface-one/vim-dlang-phobos-highlighter'

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

if filereadable(stdpath('config') . '/autofuncs.vim')
   source $XDG_CONFIG_HOME/nvim/autofuncs.vim
endif
