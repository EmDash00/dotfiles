"------------------------vim-latex-preview----------------------------
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'sympytex'
let g:livepreview_cursorhold_recompile = 0

"----------------------markdown-preview.nvim--------------------------

let g:mkdp_auto_close = 1
let g:mkdp_theme = 'light'

"------------------------------vimtex---------------------------------
let g:tex_flavor = 'latex'

"-------------------------------COC-----------------------------------
set updatetime=16

set shortmess+=c

highlight CocHighlightText ctermbg=16 guibg=#383E47

"------------------------------------------------------------
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1


"-----------------------------Tmuxline--------------------------------
  let g:tmuxline_preset = {
     \'a'       : '#S',
     \'win'     : '#I #W',
     \'cwin'    : '#I #W',
    \'z'       : '#H',
     \'options' : {'status-justify' : 'left'}}
