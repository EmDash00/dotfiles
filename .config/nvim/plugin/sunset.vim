let g:sunset_latitude = 41.675007
let g:sunset_longitude = -86.253251
let g:sunset_utc_offset = -5

function! Sunset_daytime_callback()
   "set background=light
   "set cursorline

   "let g:neosolarized_contrast = "high"
   "let g:neosolarized_visibility = "high" 
   "colorscheme NeoSolarized

   " Not needed hi CursorLine   cterm=NONE ctermfg=white guibg=#f4edcb
   "hi CursorLine   cterm=NONE ctermfg=white guibg=#f4efcb

endfunction

function! Sunset_nighttime_callback()
   set background=dark
   
   colorscheme one
   "hi LineNr term=bold cterm=bold ctermfg=2 guifg=#c6c6c6 
endfunction

