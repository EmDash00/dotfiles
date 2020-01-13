"Uncomment these lines if you want NERDTree to open on start

"autocmd vimenter * NERDTree | wincmd w
autocmd StdinReadPre * let s:std_in = 1
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


"--------------------------------------------
"Autoclose ale info window when neovim is closing
augroup CloseLoclistWindowGroup
   autocmd!
   autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

"--------------------------------------------
"Autoclose neovim completion tips when done with completion
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"--------------------------------------------
"Autostrip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
   let l = line(".")
   let c = col(".")
   %s/\s\+$//e
   call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
