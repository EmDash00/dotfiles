"-----------------------------ChadTree--------------------------------
"let g:NERDTreeWinPos = 'right'
"let g:NERDTreeShowHidden=1

let g:chadtree_settings = {
  \ "view.open_direction": "right",
  \ "keymap.delete": ["m"],
  \ "keymap.trash": ["r"],
  \ "keymap.tertiary": ["t"],
\}

"------------------------vim-latex-preview----------------------------
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'sympytex'
let g:livepreview_cursorhold_recompile = 0


"----------------------markdown-preview.nvim--------------------------

let g:mkdp_auto_close = 1
let g:mkdp_theme = 'light'

"------------------------------vimtex---------------------------------
let g:tex_flavor = 'latex'

"----------------------------UtiliSnips-------------------------------


"-------------------------------COC-----------------------------------
set updatetime=16

set shortmess+=c

highlight CocHighlightText ctermbg=16 guibg=#383E47

"-------------------------------Ale-----------------------------------
let b:ale_open_list = 1
let b:ale_list_window_size = 5

let g:ale_linters = {
         \ 'python' : ['pyright'],
         \ 'rust' : ['analyzer'],
         \ 'tex': ['texlab']
         \ }

let g:ale_fixers = {
                   \ 'python' : ['autopep8', 'yapf', 'isort'], 
                   \ 'd' : ['dfmt'],
                   \ 'rust' : ['rustfmt']
                  \}

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


"-----------------------------Airline---------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#ale#enabled = 1 
"

"hi Container guifg=#BADA55 guibg=Black
"set statusline+=%#Container#%{g:currentContainer}
"
"----------------------------Polyglot--------------------------------
let g:python_highlight_spaces_errors = 1

"----------------------------Deoplete--------------------------------
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('num_processes', 2)
"call deoplete#custom#option('max_list', 15)


"----------------------------SimpylFold------------------------------
let g:SimpylFold_docstring_preview = 1
set foldlevel=99

"---------------------------Vim Anyfold------------------------------
autocmd FileType c,cpp,rs,d,java,php,ruby AnyFoldActivate
let g:anyfold_fold_comments=1
hi Folded term=NONE cterm=NONE

"------------------------------Semshi--------------------------------
hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign
