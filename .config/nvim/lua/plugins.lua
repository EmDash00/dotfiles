-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system(
    {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
  )
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    use 'gpanders/editorconfig.nvim'

    --Configuration
    use 'svermeulen/vimpeccable'

    -- IDE
    --use {'neoclide/coc.nvim', branch = 'release'}
    use 'neovim/nvim-lspconfig'

    use {'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'pseewald/vim-anyfold'
    use 'ludovicchabant/vim-gutentags'

    use 'godlygeek/tabular'

    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'

    use 'preservim/nerdcommenter'
    use 'chentoast/marks.nvim' 

    use 'jamestthompson3/nvim-remote-containers'

    --Navigation
    use 'easymotion/vim-easymotion'
    use 'lotabout/skim'
    use 'lotabout/skim.vim'

    use 'christoomey/vim-tmux-navigator'

    --Syntax
    use 'PotatoesMaster/i3-vim-syntax'
    use 'sheerun/vim-polyglot'
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
    use 'smitajit/bufutils.vim'
    use 'tiagovla/scope.nvim'

    -- UI
    use {
      'akinsho/bufferline.nvim', 
      tag = 'v2.*', 
      requires = 'kyazdani42/nvim-web-devicons'
    }

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use {'mhinz/vim-startify', requires = 'ryanoasis/vim-devicons'}

    use 'b4b4r07/vim-sunset'


    use {'junegunn/goyo.vim', ft = {'markdown'}, config = 'vim.cmd [[Goyo]]'}

    use {'junegunn/limelight.vim', ft = {'markdown'}}

    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        ft = 'markdown'
    }

    use {'xuhdev/vim-latex-live-preview', ft = 'tex'}

    -- Colorschemes
    use 'rakr/vim-one'

    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded'})
      end
    }
  }
}
