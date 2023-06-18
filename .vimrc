set number
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable mouse clicking
set mouse=
set ttymouse=

" Center cursor when moving vertically using j/k
set scrolloff=9999

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


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
