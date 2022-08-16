-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/emdash00/.cache/zsh/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/emdash00/.cache/zsh/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/emdash00/.cache/zsh/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/emdash00/.cache/zsh/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/emdash00/.cache/zsh/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["bufutils.vim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/bufutils.vim",
    url = "https://github.com/smitajit/bufutils.vim"
  },
  chadtree = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/chadtree",
    url = "https://github.com/ms-jpq/chadtree"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["goyo.vim"] = {
    config = { "vim.cmd [[Goyo]]" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/opt/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["i3-vim-syntax"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/i3-vim-syntax",
    url = "https://github.com/PotatoesMaster/i3-vim-syntax"
  },
  ["indentpython.vim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/indentpython.vim",
    url = "https://github.com/vim-scripts/indentpython.vim"
  },
  ["limelight.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/opt/limelight.vim",
    url = "https://github.com/junegunn/limelight.vim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-remote-containers"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/nvim-remote-containers",
    url = "https://github.com/jamestthompson3/nvim-remote-containers"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["scope.nvim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/scope.nvim",
    url = "https://github.com/tiagovla/scope.nvim"
  },
  skim = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/skim",
    url = "https://github.com/lotabout/skim"
  },
  ["skim.vim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/skim.vim",
    url = "https://github.com/lotabout/skim.vim"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  tabular = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ultisnips = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["verilog_systemverilog.vim"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/verilog_systemverilog.vim",
    url = "https://github.com/vhda/verilog_systemverilog.vim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-anyfold"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-anyfold",
    url = "https://github.com/pseewald/vim-anyfold"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-dlang-phobos-highlighter"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-dlang-phobos-highlighter",
    url = "https://github.com/scarface-one/vim-dlang-phobos-highlighter"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  },
  ["vim-latex-live-preview"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/opt/vim-latex-live-preview",
    url = "https://github.com/xuhdev/vim-latex-live-preview"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-one"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-one",
    url = "https://github.com/rakr/vim-one"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-startify",
    url = "https://github.com/mhinz/vim-startify"
  },
  ["vim-sunset"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-sunset",
    url = "https://github.com/b4b4r07/vim-sunset"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  vimpeccable = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vimpeccable",
    url = "https://github.com/svermeulen/vimpeccable"
  },
  vimtex = {
    loaded = true,
    path = "/home/emdash00/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'goyo.vim', 'markdown-preview.nvim', 'limelight.vim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-latex-live-preview'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
