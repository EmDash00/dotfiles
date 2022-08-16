"--------------------------------------------
"Autoclose ale info window when neovim is closing
augroup CloseLoclistWindowGroup
   autocmd!
   autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

"--------------------------------------------
"Autoclose neovim completion tips when done with completion
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd InsertLeave * silent! pclose

"--------------------------------------------
"Autostrip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
   let l = line(".")
   let c = col(".")
   %s/\s\+$//e
   call cursor(l, c)
endfun


autocmd FileType c,cpp,d,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
