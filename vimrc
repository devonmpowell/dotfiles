" VIMRC
" Devon Powell

" Auto-load packages for tricking out the editor
execute pathogen#infect()
filetype plugin indent on 

" lets Vim work with GNU Screen
if match($TERM, "screen")!=-1
  set term=xterm
endif

" colors!
colorscheme elflord

" turn on line numbering and syntax highlights
syntax on
set number

" soft wrapping
set tw=200

" tab display width
set shiftwidth=4
set tabstop=4

" set c-style autoindents
" set cindent

" allow mouse use in terminal
set mouse=a

" change the leader key to comma instead of /
let mapleader = ","

"Some cool stuff for smart brace completion
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
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
