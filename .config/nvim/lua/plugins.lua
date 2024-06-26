-- Bootstrap packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

package.path = package.path .. ";" .. vim.fn.expand("$HOME") ..
  "/.luarocks/share/lua/5.1/?.lua;"

package.path = package.path .. ";" .. vim.fn.expand("$HOME") ..
  "/.luarocks/share/lua/5.1/?/init.lua;"

return require('lazy').setup(
  {
    --Configuration
    'wbthomason/packer.nvim',
    'svermeulen/vimpeccable',

    'gpanders/editorconfig.nvim',

    -- IDE
    --{'neoclide/coc.nvim', branch = 'release'}

    'windwp/nvim-autopairs',
    {'jose-elias-alvarez/null-ls.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'neovim/nvim-lspconfig', dependencies = { 'onsails/lspkind.nvim' } },

    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'tamago324/cmp-zsh',
        'quangnguyen30192/cmp-nvim-ultisnips',
      }
    },

    {
      'nvim-treesitter/nvim-treesitter',
      build = ":TSUpdate",
    },

    -- 'ludovicchabant/vim-gutenversions',

    'godlygeek/tabular',

    {
      'SirVer/ultisnips',
      dependencies = { { 'honza/vim-snippets', rtp = '.' } }
    },

    'preservim/nerdcommenter',
    'chentoast/marks.nvim',

    --"tversteeg/registers.nvim"

    'jamestthompson3/nvim-remote-containers',

    {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
    },

    {
      "lewis6991/gitsigns.nvim"
    },

    --Navigation
    'easymotion/vim-easymotion',
    'lotabout/skim',
    'lotabout/skim.vim',

    'christoomey/vim-tmux-navigator',

    'simrat39/symbols-outline.nvim',

    {
      'akinsho/bufferline.nvim',
      version = '*',
      dependencies = 'nvim-tree/nvim-web-devicons'
    },

    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {}
      end,
    },

    {
      'sudormrfbin/cheatsheet.nvim',

      dependencies = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
      }
    },
    'stevearc/dressing.nvim',
    {
      'nvim-telescope/telescope.nvim', version = '0.1.x',
      dependencies = {
        {
          'nvim-lua/plenary.nvim',
          'nvim-tree/nvim-web-devicons',
        }
      }
    },
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
        end,
    },
    {
      "3rd/image.nvim",
      event = "VeryLazy",
      version = "1.1.0",
      dependencies = {
        {
          "nvim-treesitter/nvim-treesitter",
          build = ":TSUpdate",
          config = function()
            require("nvim-treesitter.configs").setup({
              ensure_installed = { "markdown" },
              modules = { },
              ignore_install = { },
              sync_install = false,
              auto_install = true,
              highlight = { enable = true },
            })
          end,
        },
      },
      opts = {
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "norg" },
          },
        },
        max_width = 100,
        max_height = 12,
        max_width_window_percentage = math.huge,
        max_height_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        --kitty_method = "normal",
      },
    },

    --Syntax
    'PotatoesMaster/i3-vim-syntax',

    'vhda/verilog_systemverilog.vim',
    'uiiaoo/java-syntax.vim',
    'scarface-one/vim-dlang-phobos-highlighter',
    'plasticboy/vim-markdown',
    'lervag/vimtex',

    -- Language Specific
    'mattn/emmet-vim',
    'vim-scripts/indentpython.vim',

    -- Utility
    'lambdalisue/suda.vim',
    'tpope/vim-eunuch',
    'tiagovla/scope.nvim',

    -- UI
    { 'Shatur/neovim-session-manager', dependencies = {'nvim-lua/plenary.nvim'} },
    'ahmedkhalf/project.nvim',

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts={} },
    { 'HiPhish/rainbow-delimiters.nvim' },

    --'vim-airline/vim-airline'
    --'vim-airline/vim-airline-themes'
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
      'antosha417/nvim-lsp-file-operations',
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-tree.lua",
      },
    },

    { 'mhinz/vim-startify', dependencies = 'ryanoasis/vim-devicons' },

    -- 'b4b4r07/vim-sunset',


    { 'junegunn/goyo.vim', ft = { 'markdown' }, config = 'vim.cmd [[Goyo]]' },

    { 'junegunn/limelight.vim', ft = { 'markdown', 'tex' } },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    'karb94/neoscroll.nvim',

    -- Colorschemes
    'navarasu/onedark.nvim',
    'rakr/vim-one',
  },
  {
    border = "rounded"
  }
)
