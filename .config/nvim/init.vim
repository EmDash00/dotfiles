set number
set expandtab
set noshowmode

set hidden

set backspace=2
set laststatus=2
set tabstop=2
set shiftwidth=2
set signcolumn=number

set termguicolors

"Vim clipboard is the system clipboard
set clipboard=unnamedplus

"Blinking cursor
set guicursor=a:blinkwait500-blinkon300-blinkoff200,i-ci:ver30-blinkwait500-blinkon300-blinkoff200

let g:loaded_python_provider = 0
"let g:ale_disable_lsp = 1 

call plug#begin(stdpath('data') . '/plugged')
   "----------------Completion---------------
   
   "Plug 'w0rp/ale'

   Plug 'neoclide/coc.nvim', {'branch': 'release'}

   Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

   Plug 'ludovicchabant/vim-gutentags'

   Plug 'mattn/emmet-vim'

   Plug 'lotabout/skim'
   Plug 'lotabout/skim.vim'

   Plug 'SirVer/ultisnips'
      Plug 'honza/vim-snippets'

   "-----------------Utility-----------------
   Plug 'smitajit/bufutils.vim'
   Plug 'pseewald/vim-anyfold'
   Plug 'tpope/vim-fugitive'
   Plug 'tpope/vim-eunuch'
   Plug 'preservim/nerdcommenter'
   Plug 'easymotion/vim-easymotion'
   "Plug 'simrat39/symbols-outline.nvim'
   Plug 'terryma/vim-multiple-cursors'
   Plug 'christoomey/vim-tmux-navigator'
   Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
   "Plug 'preservim/nerdtree'
   Plug 'lambdalisue/suda.vim'
   Plug 'jamestthompson3/nvim-remote-containers'

   Plug 'milkypostman/vim-togglelist'

   Plug 'godlygeek/tabular'

   
   "------------Language Specific-----------
   "Plug 'rust-lang/rust.vim'
   Plug 'tmhedberg/SimpylFold'
   Plug 'vim-scripts/indentpython.vim'


   "---------------Appearance---------------
   Plug 'mhinz/vim-startify'
   Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'

   Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
   Plug 'kshenoy/vim-signature'

   Plug 'b4b4r07/vim-sunset'

   Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

   Plug 'junegunn/limelight.vim'
   Plug 'junegunn/goyo.vim'

   Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

   "---------------Syntatical---------------
   Plug 'PotatoesMaster/i3-vim-syntax'
   Plug 'scarface-one/vim-dlang-phobos-highlighter'
   Plug 'kevinoid/vim-jsonc'

   Plug 'dbeniamine/todo.txt-vim'
   Plug 'lervag/vimtex'
   "Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
   Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
   Plug 'plasticboy/vim-markdown'
   Plug 'sheerun/vim-polyglot'
   Plug 'vhda/verilog_systemverilog.vim'

   
   "--------------Colorschemes--------------
   Plug 'ayu-theme/ayu-vim'
   Plug 'base16-project/base16-vim'
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

   "Has to be last
   Plug 'ryanoasis/vim-devicons'
   Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

lua << EOF
require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "coc",
    diagnostics_update_in_insert = true,
	
	 	diagnostics_indicator = function(count, level, diagnostics_dict, context)
		 local s = ""
		 for e, n in pairs(diagnostics_dict) do
			 local sym = e == "error" and " "
				 or (e == "warning" and " " or " " )
			 s = s .. sym .. n .. " "
		 end
		 return s
	 	end,
    custom_filter = function(buf_number, buf_numbers)
      -- filter out filetypes you don't want to see
      -- filter out by buffer name

      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      if vim.bo[buf_number].filetype ~= "qf" then
        return true
      end
    end,
    offsets = {{filetype = "CHADTree", text = "File Explorer"}},
    color_icons = true, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'extension'
  }
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "lua", "rust", "python", "d", "latex" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = false,
   -- disable = { "python" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}
EOF

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
