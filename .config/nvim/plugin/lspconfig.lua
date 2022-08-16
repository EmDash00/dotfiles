vimp = require('vimp')
local nnoremap = vimp.nnoremap

local cmd = vim.cmd
local diagnostic, lsp = vim.diagnostic, vim.lsp

vim.o.updatetime = 250

diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  float = {
    border = 'asdf'
  },
  update_in_insert = false,
  severity_sort = true
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = {'silent'}

nnoremap(opts, '<space>e', diagnostic.open_float)
nnoremap(opts, '<leader>j', diagnostic.goto_next)
nnoremap(opts, '<leader>k', diagnostic.goto_prev)
nnoremap(opts, '<space>q', diagnostic.setloclist)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.lsp.omnifunc')

  vimp.add_buffer_maps(
    buffnr,
    function()
      -- Mappings.
      -- See `:help lsp.*` for documentation on any of the below functions
      nnoremap(opts, 'gD', lsp.buf.declaration)
      nnoremap(opts, 'gd', lsp.buf.definition)
      nnoremap(opts, 'K', lsp.buf.hover)
      nnoremap(opts, 'gi', lsp.buf.implementation)

      nnoremap(opts, '<leader>h', lsp.buf.signature_help)
      nnoremap(opts, '<leader>wa', lsp.buf.add_workspace_folder)
      nnoremap(opts, '<leader>wr', lsp.buf.remove_workspace_folder)
      nnoremap(
        opts,
        '<leader>wl', 
        function()
          print(vim.inspect(lsp.buf.list_workspace_folders()))
        end 
      )
      nnoremap(opts, 'td', lsp.buf.type_definition)
      nnoremap(opts, '<leader>rn', lsp.buf.rename)
      nnoremap(opts, '<leader>ac', lsp.buf.code_action)
      nnoremap(opts, 'gr', lsp.buf.references)
      nnoremap(opts, '<leader>f', lsp.buf.format {async = true})
    end
  )


  vim.api.nvim_create_autocmd(
    "CursorHold", 
    {
      buffer = bufnr,
      callback = function()
        diagnostic.open_float(
          nil, 
          {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'rounded',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
          }   
        )
      end
    }
  )
end

local lsp_flags = {
  debounce_text_changes = 150,
}

require('lspconfig').pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig').serve_d.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig').clangd.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      ["rust-analyzer"] = {}
    }
}
