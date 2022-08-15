local api = vim.api

api.nvim_command('source $XDG_CONFIG_HOME/nvim/plugin/coc.vim')

--[[
api.nvim_set_keymap('n', '<leader>f', ':call CocFix()<CR>', {noremap = true, silent = true})

api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {noremap = true, silent = true})
api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {noremap = true, silent = true})
api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {noremap = true, silent = true})
api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {noremap = true, silent = true})
api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {noremap = true, silent = true})
api.nvim_set_keymap('n', 'K', ':call ShowDocumentation()<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>a', ':call ToggleDiagnostics()<CR>', {noremap = true, silent = true})

api.nvim_set_keymap(
  'n', '<leader>k', '<Plug>(coc-diagnostic-prev)', 
  {noremap = true, silent = true}
)
api.nvim_set_keymap(
  'n', '<leader>j', '<Plug>(coc-diagnostic-next)', 
  {noremap = true, silent = true}
)
api.nvim_set_keymap(
  'n', '<leader>K', '<Plug>(coc-diagnostic-prev-error)', 
  {noremap = true, silent = true}
)
api.nvim_set_keymap(
  'n', '<leader>J', '<Plug>(coc-diagnostic-next-error)', 
  {noremap = true, silent = true}
)

api.nvim_set_keymap(
  'n', '<leader>cl', '<Plug>(coc-codelens-action)', 
  {noremap = true, silent = true}
)

api.nvim_set_keymap(
  'n', '<leader>ac', '<Plug>(coc-codeaction)', 
  {noremap = true, silent = true}
)
api.nvim_set_keymap(
  'n', '<leader>ac', '<Plug>(coc-fix-current)', 
  {noremap = true, silent = true}
)

-- 
api.nvim_set_keymap(
  'i', '<TAB>', 
  'coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\\<TAB>" : coc#refresh()', 
  {noremap = true, silent = true, expr = true}
)

api.nvim_set_keymap(
  'i', '<S-TAB>', 
  'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"', 
  {noremap = true, silent = true, expr = true}
)

api.nvim_set_keymap(
  'i', '<CR>', 
  'coc#pum#visible() ? coc#pum#confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"', 
  {noremap = true, silent = true, expr = true}
)

api.nvim_set_keymap(
  'n', '<C-f>', 
  'coc#float#has_scroll() ? coc#float#scroll(1) : "\\<C-f>"',
  {silent = true, nowait = true, expr = true}
)

api.nvim_set_keymap(
  'n', '<C-b>', 
  'coc#float#has_scroll() ? coc#float#scroll(0) : "\\<C-b>"',
  {silent = true, nowait = true, expr = true}
)

api.nvim_set_keymap(
  'i', '<C-f>', 
  'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(1)\\<CR>" : "\\<Right>"',
  {silent = true, nowait = true, expr = true}
)

api.nvim_set_keymap(
  'i', '<C-b>', 
  'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(0)\\<CR>" : "\\<Left>"',
  {silent = true, nowait = true, expr = true}
)

api.nvim_set_keymap(
  'v', '<C-f>', 
  'coc#float#has_scroll() ? coc#float#scroll(1) : "\\<C-f>"',
  {silent = true, nowait = true, expr = true}
)

api.nvim_set_keymap(
  'v', '<C-b>', 
  'coc#float#has_scroll() ? coc#float#scroll(0) : "\\<C-b>"',
  {silent = true, nowait = true, expr = true}
)
--]]
