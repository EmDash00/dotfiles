"-----------------------------NERDTree--------------------------------
let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden=1
"----------------------------UtiliSnips-------------------------------
let g:UltiSnipsSnippetsDir = "~/.config/vim/UltiSnips"
let g:UltiSnipsExpandTrigger="<leader>e"
let g:UltiSnipsJumpForwardTrigger="<c-i>"
let g:UltiSnipsJumpBackwardTrigger="<c-u>"


"-------------------------------Ale-----------------------------------
let b:ale_open_list = 1
let b:ale_list_window_size = 5

"let b:ale_linters = ['flake8']
"let b:ale_fixers = {'python' : ['autopep8', 'yapf'], 'd' : ['dfmt']}

"-------------------------Completion Opts-----------------------------

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1

let g:LanguageClient_autoStart = 1
"let g:LanguageClient_diagnosticsEnable = 1
let g:LanguageClient_serverCommands = {
       \ 'd': ['/home/emdash00/.dub/packages/.bin/dls-latest/dls']
    \ }

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

function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))

   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors

   return l:counts.total == 0 ? 'OK' : printf(
   \   '%dW %dE',
   \   all_non_errors,
   \   all_errors
   \)
endfunction

set statusline=%{LinterStatus()}


"----------------------------Polyglot--------------------------------
let g:python_highlight_spaces_errors = 1


"------------------------------YCM-----------------------------------
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1


"----------------------------Deoplete--------------------------------
let g:deoplete#enable_at_startup = 1


"----------------------------SimpylFold------------------------------
let g:SimpylFold_docstring_preview = 1

