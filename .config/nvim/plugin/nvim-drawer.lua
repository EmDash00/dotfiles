local drawer = require("nvim-drawer")

drawer.setup()

local nvim_tree_api = require("nvim-tree.api")
--local trouble = require('trouble')

drawer.create_drawer({
  -- This is needed for nvim-tree.
  --nvim_tree_hack = true,
  should_reuse_previous_bufnr = false,

  -- Position on the right size of the screen.
  position = "left",
  size = 30,

  --Alternatively, you can have it floating.
  --size = 40,
  --position = 'float',
  --win_config = {
  --margin = 2,
  --border = 'rounded',
  --anchor = 'CE',
  --width = 40,
  --height = '80%',
  --},

  on_vim_enter = function(event)
    --- Open the drawer on startup.
    --event.instance.open({
    --focus = false,
    --})

    --- Example mapping to toggle.
    vim.keymap.set("n", "<C-f>", event.instance.toggle)
  end,

  --- Ideally, we would just call this here and be done with it, but
  --- mappings in nvim-tree don't seem to apply when re-using a buffer in
  --- a new tab / window.
  on_did_create_buffer = function()
    nvim_tree_api.tree.open({ current_window = true })
  end,

  --- This gets the tree to sync when changing tabs.
  on_did_open = function()
    nvim_tree_api.tree.reload()

    vim.opt_local.number = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.statuscolumn = ""
  end,

  --- Cleans up some things when closing the drawer.
  on_did_close = nvim_tree_api.tree.close,
})
