colors = {}

local cmd = vim.cmd
local api = vim.api

function colors.set_hls(highlights) 
  for hl, params in pairs(highlights) do 
    local ns_id = 0

    if params.ns_id ~= nil then
      ns_id = params.ns_id
    end

    api.nvim_set_hl(ns_id, hl, params)
  end
end

api.nvim_create_autocmd(
  'ColorScheme', 
  {
    pattern = '*',
    callback = function()
      require('colors.nvim')
      require('colors.lspkinds')
      require('colors.diagnostic')
      require('colors.bufferline')
      require('colors.nvim_tree')
    end
  }
)

return colors
