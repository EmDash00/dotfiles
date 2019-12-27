setl enc=utf-8
setl fenc=utf-8
setl termencoding=utf-8
setl nocompatible
setl cindent
setl tabstop=3
setl shiftwidth=3
setl expandtab
setl textwidth=80
setl colorcolumn=81
setl comments=sl:/*,mb:\ *,elx:\ */
setl noshowmode

inoremap {{ {<CR>}<Esc>O
inoremap " ""<Left>

let g:ycm_global_ycm_extra_conf="/home/emdash00/.config/vim/ycm/.ycm_extra_conf.py"
