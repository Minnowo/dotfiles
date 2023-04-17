set number
syntax on
set hlsearch
set mouse=
set ttymouse=
set scrolloff=9999

" autocmd VimLeave * call system("xsel -ib", getreg('+'))
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) . ' | xclip -selection clipboard')

hi Search ctermbg='Yellow'
hi Search ctermfg='Black'

hi Visual ctermbg='White'
hi Visual ctermfg='Black'

hi ErrorMsg ctermfg='Black'
hi ErrorMsg ctermbg='Red'

" hi Comment ctermfg='DarkGrey'
" hi Comment ctermfg='DarkGrey'
"
" hi Constant 
" hi Comment ctermbg=DarkGray
" hi Constant ctermbg=Blue
" hi Normal ctermbg=Black
" hi NonText ctermbg=Black
" hi Special ctermbg=DarkMagenta
" hi Cursor ctermbg=Green
"
"
"
"
" NR-16   NR-8    COLOR NAME 
" 0       0       Black
" 1       4       DarkBlue
" 2       2       DarkGreen
" 3       6       DarkCyan
" 4       1       DarkRed
" 5       5       DarkMagenta
" 6       3       Brown, DarkYellow
" 7       7       LightGray, LightGrey, Gray, Grey
" 8       0*      DarkGray, DarkGrey
" 9       4*      Blue, LightBlue
" 10      2*      Green, LightGreen
" 11      6*      Cyan, LightCyan
" 12      1*      Red, LightRed
" 13      5*      Magenta, LightMagenta
" 14      3*      Yellow, LightYellow
" 15      7*      White
