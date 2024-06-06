local vimp = require('vimp')
local nnoremap = vimp.nnoremap

local api = require('nvim-tree.api')
local opts = { 'silent' }
--local inject_node = require("nvim-tree.utils").inject_node

-- OR setup with some options
require("nvim-tree").setup {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  trash = {
    cmd = "trash",
    require_confirm = false
  },
  renderer = {
    root_folder_label = false
  },
  view = {
    adaptive_size = true,
    centralize_selection = false,
    --height = 30,
    side = "left",
    preserve_window_proportions = true,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  filters = {
    dotfiles = true,
    custom = {
      "^.git$",
      "^.pycache$"
    }
  },
  on_attach = function(bufnr)
    vimp.add_buffer_maps(
      bufnr,
      function()
        nnoremap(opts, '<CR>', api.node.open.edit)
        nnoremap(opts, '<Shift><CR>', api.node.open.replace_tree_buffer)
        nnoremap(opts, '|', api.node.open.vertical)
        nnoremap(opts, '_', api.node.open.horizontal)
        nnoremap(opts, 'T', api.node.open.tab)

        nnoremap(opts, 'N', api.node.show_info_popup)

        nnoremap(opts, '<leader>j', api.node.navigate.diagnostics.next)
        nnoremap(opts, '<leader>k', api.node.navigate.diagnostics.prev)
        nnoremap(opts, 'gj', api.node.navigate.git.next)
        nnoremap(opts, 'gk', api.node.navigate.git.prev)
        nnoremap(opts, '^', api.node.navigate.parent)

        nnoremap(opts, 'd', api.fs.trash)
        nnoremap(opts, 'D', api.fs.remove)

        nnoremap(opts, '?', api.tree.toggle_help)
      end
    )
  end
}

nnoremap({ 'silent' }, '<C-d>', api.tree.toggle)
