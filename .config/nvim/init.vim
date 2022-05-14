set number
set expandtab
set noshowmode

set backspace=2
set laststatus=2
set tabstop=3
set shiftwidth=3

set termguicolors


"Vim clipboard is the system clipboard
set clipboard=unnamedplus

"Blinking cursor
set guicursor=a:blinkwait500-blinkon300-blinkoff200,i-ci:ver30-blinkwait500-blinkon300-blinkoff200

let g:loaded_python_provider = 0

call plug#begin(stdpath('data') . '/plugged')
   "----------------Completion---------------
   
   Plug 'w0rp/ale'

   Plug 'neoclide/coc.nvim', {'branch': 'release'}

   Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

   Plug 'mattn/emmet-vim'

   Plug '/home/emdash00/Apps/git-apps/skim'
      Plug 'lotabout/skim.vim'

   Plug 'SirVer/ultisnips'
      Plug 'honza/vim-snippets'

   "-----------------Utility-----------------
   Plug 'smitajit/bufutils.vim'
   Plug 'pseewald/vim-anyfold'
   Plug 'tpope/vim-fugitive'
   Plug 'tpope/vim-eunuch'
   Plug 'scrooloose/nerdcommenter'
   Plug 'terryma/vim-multiple-cursors'
   Plug 'christoomey/vim-tmux-navigator'
   Plug 'preservim/nerdtree'
   Plug 'lambdalisue/suda.vim'
   Plug 'jamestthompson3/nvim-remote-containers'

   Plug 'godlygeek/tabular'

   
   "------------Language Specific-----------
   "Plug 'rust-lang/rust.vim'
   Plug 'tmhedberg/SimpylFold'
   Plug 'vim-scripts/indentpython.vim'


   "---------------Appearance---------------
   Plug 'mhinz/vim-startify'
   Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
   Plug 'kshenoy/vim-signature'

   Plug 'b4b4r07/vim-sunset'

   Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

   "---------------Syntatical---------------
   Plug 'PotatoesMaster/i3-vim-syntax'
   Plug 'scarface-one/vim-dlang-phobos-highlighter'
   Plug 'kevinoid/vim-jsonc'

   Plug 'dbeniamine/todo.txt-vim'
   Plug 'lervag/vimtex'
   "Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
   Plug 'plasticboy/vim-markdown'
   Plug 'sheerun/vim-polyglot'
   Plug 'vhda/verilog_systemverilog.vim'

   
   "--------------Colorschemes--------------
   Plug 'ayu-theme/ayu-vim'
   Plug 'arzg/vim-colors-xcode'
   Plug 'morhetz/gruvbox'
   Plug 'wadackel/vim-dogrun'
   Plug 'sainnhe/edge'
   Plug 'fatih/molokai'
   Plug 'kristijanhusak/vim-hybrid-material'
   Plug 'sickill/vim-monokai'
   Plug 'joshdick/onedark.vim'
   Plug 'rakr/vim-one'
   Plug 'romainl/flattened'
   Plug 'overcache/NeoSolarized' 
   Plug 'lifepillar/vim-solarized8'
   Plug 'NLKNguyen/papercolor-theme'
call plug#end()

"Reminder not to set your address but instead the nearest large city.
let g:sunset_latitude = 41.675007
let g:sunset_longitude = -86.253251
let g:sunset_utc_offset = -5

set background=dark
set cursorline
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
