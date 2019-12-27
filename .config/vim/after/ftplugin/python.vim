setl nohlsearch
setl tabstop=4
setl shiftwidth=4
setl smarttab
setl expandtab
setl autoindent
setl textwidth=80
setl colorcolumn=81

inoremap " ""<Esc>i
inoremap <C-b> """
let g:ycm_global_ycm_extra_conf="/home/emdash00/.config/vim/ycm/python_conf.py"

let b:ale_linters = ['flake8']
let b:ale_fixers = {'python' : ['autopep8', 'yapf']}
