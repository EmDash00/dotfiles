"--------------------------------------------
"Autostrip trailing whitespace
fun! <SID>StripTrailingWhitespaces()
   let l = line(".")
   let c = col(".")
   %s/\s\+$//e
   call cursor(l, c)
endfun


autocmd FileType c,cpp,d,java,php,ruby,python,lua autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
