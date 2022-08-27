local vimp = require('vimp')
local nnoremap = vimp.nnoremap

require('trouble').setup {
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 10, -- height of the trouble list when position is top or bottom
  width = 50, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  fold_open = "",
  fold_closed = "",
  group = true,
  padding = true,
  action_keys = {
    -- map to {} to remove a mapping, for example:
    -- close = {},
    close = "<leader>dq",
    cancel = "<esc>",
    refresh = "<leader>dr",
    jump = { "<cr>" },
    open_split = { "_" }, -- open buffer in new split
    open_vsplit = { "|" }, -- open buffer in new vsplit
    open_tab = { "t" }, -- open buffer in new tab
    jump_close = { "o" }, -- jump to the diagnostic and close the list
    toggle_mode = "<leader>dm", -- toggle between "workspace" and "document" diagnostics mode
    toggle_preview = "P", -- toggle auto_preview
    hover = "K", -- opens a small popup with the full multiline message
    preview = "p", -- preview the diagnostic location
    close_folds = { "<space>c" }, -- close all folds
    open_folds = { "<space>o" }, -- open all folds
    toggle_fold = { "zA", "za" }, -- toggle fold of current file
    previous = "k", -- preview item
    next = "j" -- next item
  },
  indent_lines = true, -- add an indent guide below the fold icons
  auto_open = false, -- automatically open the list when you have diagnostics
  auto_close = true, -- automatically close the list when you have no diagnostics
  auto_preview = false,
  auto_fold = false,
  auto_jump = { "lsp_definitions" },
  use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

nnoremap({ 'silent' }, '<leader>a', ':TroubleToggle<CR>')
