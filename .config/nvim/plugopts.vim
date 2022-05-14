"-----------------------------NERDTree--------------------------------
let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden=1

"------------------------vim-latex-preview----------------------------
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'sympytex'
let g:livepreview_cursorhold_recompile = 0

"------------------------------vimtex---------------------------------
let g:tex_flavor = 'latex'

"----------------------------UtiliSnips-------------------------------
let g:UltiSnipsSnippetsDir = "~/.config/vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<leader>e"
let g:UltiSnipsJumpForwardTrigger="<c-i>"
let g:UltiSnipsJumpBackwardTrigger="<c-u>"


"-------------------------------Ale-----------------------------------
let b:ale_open_list = 1
let b:ale_list_window_size = 5
let g:ale_disable_lsp = 1

let g:ale_linters = {
         "\ 'python' : ['flake8', 'mypy'],
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
"let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1 
"

"hi Container guifg=#BADA55 guibg=Black
"set statusline+=%#Container#%{g:currentContainer}

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
