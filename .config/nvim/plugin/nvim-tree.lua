local vimp = require("vimp")
local nnoremap = vimp.nnoremap

local api = require("nvim-tree.api")
--local opts = { 'silent' }
--
local function opts(desc, bufnr)
  return { silent = true, desc = desc, buffer = bufnr}
end

local git_stage_toggle = function()
  local node = api.tree.get_node_under_cursor()
  local gs = node.git_status.file

  -- If the current node is a directory get children status
  if gs == nil then
    gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
         or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
  end

  -- If the file is untracked, unstaged or partially staged, we stage it
  if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
    vim.cmd("silent !git add " .. node.absolute_path)

  -- If the file is staged, we unstage
  elseif gs == "M " or gs == "A " then
    vim.cmd("silent !git restore --staged " .. node.absolute_path)
  end

  api.tree.reload()
end
--local inject_node = require("nvim-tree.utils").inject_node

-- OR setup with some options
require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  trash = {
    cmd = "trash",
    require_confirm = false,
  },
  renderer = {
    root_folder_label = false,
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
      "^.pycache$",
    },
  },
  on_attach = function(bufnr)
      vim.keymap.set("n", "l", api.node.open.edit, opts("Open", bufnr))
      vim.keymap.set("n", "h", api.node.open.edit, opts("Close", bufnr))
      vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All", bufnr))
      vim.keymap.set("n", "K", api.node.navigate.parent, opts("Parent", bufnr))
      vim.keymap.set("n", "a", api.fs.create, opts("Create File", bufnr))
      vim.keymap.set("n", "r", api.fs.rename, opts("Rename", bufnr))
      vim.keymap.set("n", "R", api.fs.rename, opts("Rename Basename", bufnr))

      vim.keymap.set("n", "<Shift><CR>", api.node.open.replace_tree_buffer, opts("Open and Replace Current Buffer", bufnr))
      vim.keymap.set("n", "|", api.node.open.vertical, opts("Vertical Split", bufnr))
      vim.keymap.set("n", "_", api.node.open.horizontal, opts("Horizontal Split", bufnr))
      vim.keymap.set("n", "T", api.node.open.horizontal, opts("Open in New Tab", bufnr))

      vim.keymap.set("n", "<leader>j", api.node.navigate.diagnostics.next, opts("Diagnostics Next", bufnr))
      vim.keymap.set("n", "<leader>j", api.node.navigate.diagnostics.prev, opts("Diagnostics Previous", bufnr))

      vim.keymap.set("n", "gj", api.node.navigate.git.next, opts("Git Next", bufnr))
      vim.keymap.set("n", "gk", api.node.navigate.git.prev, opts("Git Previous", bufnr))
      vim.keymap.set("n", "d", api.fs.trash, opts("Trash", bufnr))
      vim.keymap.set("n", "D", api.fs.remove, opts("Delete", bufnr))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Toggle Help", bufnr))
      vim.keymap.set("n", "gs", git_stage_toggle, opts("Git Stage Toggle", bufnr))
      vim.keymap.set("n", "si", api.tree.toggle_hidden_filter, opts("Toggle Git Ignored Files", bufnr))
      vim.keymap.set("n", "sh", api.tree.toggle_hidden_filter, opts("Toggle Hidden File Filter", bufnr))

      --nnoremap(opts, "<CR>", api.node.open.edit)
      --nnoremap(opts, "<Shift><CR>", api.node.open.replace_tree_buffer)
      --nnoremap(opts, "|", api.node.open.vertical)
      --nnoremap(opts, "_", api.node.open.horizontal)
      --nnoremap(opts, "T", api.node.open.tab)

      --nnoremap(opts, "N", api.node.show_info_popup)

      --nnoremap(opts, "<leader>j", api.node.navigate.diagnostics.next)
      --nnoremap(opts, "<leader>k", api.node.navigate.diagnostics.prev)
      --nnoremap(opts, "gj", api.node.navigate.git.next)
      --nnoremap(opts, "gk", api.node.navigate.git.prev)
      --nnoremap(opts, "^", api.node.navigate.parent)

      --nnoremap(opts, "d", api.fs.trash)
      --nnoremap(opts, "D", api.fs.remove)

      --nnoremap(opts, "?", api.tree.toggle_help)
  end,
})


--nnoremap({ "silent" }, "<C-d>", api.tree.toggle)
