-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PackerBoostrap = fn.system(
    { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  )
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup {
  function(use)
    --Configuration
    use 'wbthomason/packer.nvim'
    use 'svermeulen/vimpeccable'

    use 'gpanders/editorconfig.nvim'

    -- IDE
    --use {'neoclide/coc.nvim', branch = 'release'}

    use {'windwp/nvim-autopairs'}
    use {'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'neovim/nvim-lspconfig', requires = { 'onsails/lspkind.nvim' } }

    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'tamago324/cmp-zsh',
        'quangnguyen30192/cmp-nvim-ultisnips',
      }
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    use 'ludovicchabant/vim-gutentags'

    use 'godlygeek/tabular'

    use {
      'SirVer/ultisnips',
      requires = { { 'honza/vim-snippets', rtp = '.' } }
    }

    use 'preservim/nerdcommenter'
    use 'chentoast/marks.nvim'

    --use "tversteeg/registers.nvim"

    use 'jamestthompson3/nvim-remote-containers'

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }

    --Navigation
    use 'easymotion/vim-easymotion'
    use 'lotabout/skim'
    use 'lotabout/skim.vim'

    use 'christoomey/vim-tmux-navigator'

    use 'simrat39/symbols-outline.nvim'

    use {
      'akinsho/bufferline.nvim',
      tag = 'v2.*',
      requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
      'sudormrfbin/cheatsheet.nvim',

      requires = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
      }
    }
    use {'stevearc/dressing.nvim'}
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      requires = {
        {
          'nvim-lua/plenary.nvim',
          'kyazdani42/nvim-web-devicons',
        }
      }
    }

    --Syntax
    use 'PotatoesMaster/i3-vim-syntax'
    use 'vhda/verilog_systemverilog.vim'
    use 'scarface-one/vim-dlang-phobos-highlighter'
    use 'plasticboy/vim-markdown'
    use 'lervag/vimtex'

    -- Language Specific
    use 'mattn/emmet-vim'
    use 'vim-scripts/indentpython.vim'

    -- Utility
    use 'lambdalisue/suda.vim'
    use 'tpope/vim-eunuch'
    use 'tiagovla/scope.nvim'

    -- UI
    use {'Shatur/neovim-session-manager', requires = {'nvim-lua/plenary.nvim'}}
    use 'ahmedkhalf/project.nvim'

    use "lukas-reineke/indent-blankline.nvim"

    --use 'vim-airline/vim-airline'
    --use 'vim-airline/vim-airline-themes'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use { 'mhinz/vim-startify', requires = 'ryanoasis/vim-devicons' }

    use 'b4b4r07/vim-sunset'


    use { 'junegunn/goyo.vim', ft = { 'markdown' }, config = 'vim.cmd [[Goyo]]' }

    use { 'junegunn/limelight.vim', ft = { 'markdown' } }

    use {
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
      ft = 'markdown'
    }

    use { 'xuhdev/vim-latex-live-preview', ft = 'tex' }

    use 'karb94/neoscroll.nvim'

    -- Colorschemes
    use 'navarasu/onedark.nvim'
    use 'rakr/vim-one'

    if PackerBoostrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end
    }
  }
}
