local cmp = require('cmp')
local mapping = cmp.mapping
local SelectBehavior = cmp.SelectBehavior

require("cmp_nvim_ultisnips").setup{
  filetype_source = "ultisnips_default",
  show_snippets = 'all'
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp_kinds = {
  Text = '',
  Method = '()',
  Function = '()',
  Constructor = '',
  Field = '',
  Variable = 'ﳛ',
  Class = 'ﰩ',
  Interface = 'ﯲ',
  Module = '',
  Property = 'ﴯ',
  Unit = '塞',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '螺',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '●',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = 'ﭨ',
}

cmp.setup {
  snippet = {
    expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end
  },
  window = {
     --completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  sources = cmp.config.sources (
    {
      {name = 'nvim_lsp'},
      {name = 'ultisnips'}
    },
    {{name = 'buffer'}}
  ),
  mapping = {
    ["<Tab>"] = mapping {
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = SelectBehavior.Insert })
        else
          cmp.complete()
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = SelectBehavior.Insert })
        elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
        else
          fallback()
        end
      end,
      s = function(fallback)
        if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
          vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
        else
          fallback()
        end
      end
    },
    ["<S-Tab>"] = mapping({
        c = function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = SelectBehavior.Insert })
            else
                cmp.complete()
            end
        end,
        i = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = SelectBehavior.Insert })
            elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
                fallback()
            end
        end,
        s = function(fallback)
            if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
            else
                fallback()
            end
        end
    }),
    ['<Down>'] = mapping(mapping.select_next_item({behavior = SelectBehavior.Select}), {'i'}),
    ['<Up>'] = mapping(mapping.select_prev_item({behavior = SelectBehavior.Select}), {'i'}),

    ['<C-n>'] = mapping{
      c = function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = SelectBehavior.Select })
        else
          vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = SelectBehavior.Select })
        else
          fallback()
        end
      end
    },

    ['<C-p>'] = mapping{
      c = function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = SelectBehavior.Select })
        else
          vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
        end
      end,
      i = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = SelectBehavior.Select })
        else
          fallback()
        end
      end
    },
    ['<C-d>'] = mapping(mapping.scroll_docs(-4), {'i', 'c'}),

    ['<C-f>'] = mapping(mapping.scroll_docs(4), {'i', 'c'}),

    ['<C-Space>'] = mapping(mapping.complete(), {'i', 'c'}),

    ['<C-e>'] = mapping{i = mapping.close(), c = mapping.close()},

    ['<CR>'] = mapping{
      i = mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
      c = function(fallback)
        if cmp.visible() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end
    }
  },
  enabled = function()
    -- disable completion in comments
    local context = require 'cmp.config.context'
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture("comment") 
    end
  end,
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      --kind.menu = "    (" .. strings[2] .. ")"
      kind.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]

      return kind
    end,
  },
}

--cmp.setup.cmdline('/', {
  --mapping = cmp.mapping.preset.cmdline(),
  --sources = {
    --{ 
      --name = 'buffer',
      --option = {
        --keyword_length = 10
      --}
    --}
  --},
--})

--Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
  --mapping = cmp.mapping.preset.cmdline(),
  --sources = cmp.config.sources({
    --{ name = 'path' }
  --}, {
    --{ name = 'cmdline' }
  --})
--})
