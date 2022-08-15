inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<ESC>O
inoremap ' ''<Left>

inoremap <leader>' '
inoremap <leader>" "
inoremap <leader>( (
inoremap <leader>{ {
inoremap <leader>[ [

vnoremap ( <Esc>`>a)<Esc>`<i(<Esc>
vnoremap { <Esc>`>a}<Esc>`<i{<Esc>
vnoremap [ <Esc>`>a]<Esc>`<i[<Esc>
vnoremap _" <Esc>`>a"<Esc>`<i"<Esc>
vnoremap ' <Esc>`>a'<Esc>`<i'<Esc>

autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
      return "\<Right>"
   else
      return a:char
   endif
endf

function QuoteDelim(char)
   let line = getline('.')
   let col = col('.')
   if line[col - 2] == "\\"
   "Inserting a quoted quotation mark into the string
      return a:char
   elseif line[col - 1] == a:char
   "Escaping out of the string
      return "\<Right>"
   else
   "Starting a string
      return a:char.a:char."\<Esc>i"
   endif
endf

