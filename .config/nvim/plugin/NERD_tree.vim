"Uncomment these lines if you want NERDTree to open on start

"autocmd vimenter * NERDTree | wincmd w
"
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
"autocmd StdinReadPre * let s:std_in = 1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
   "\ exe 'NERDTree' argv()[0] |
   "\ wincmd p |
   "\ ene |
   "\ exe 'cd '.argv()[0] |
   "\ endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | 
"  \ q | 
"  \ endif
