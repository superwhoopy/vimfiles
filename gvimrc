" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org


if has('win32')
  if has('nvim')
    Guifont Consolas NF:h8
  else
    set guifont=Consolas_NF:h8:cANSI:qDRAFT
  endif
else " Unix
  if has('nvim')
    Guifont Inconsolata For Powerline:h10
  else
    set guifont=Source\ Code\ Pro\ For\ Powerline\ Medium\ 8
  endif
endif

colorscheme flattened_dark
:AirlineTheme solarized
let g:airline_solarized_bg='dark'

set go-=T                  " ne pas afficher la toolbar
set go-=m                  " ne pas afficher la menubar
set go-=r                  " do not show vertical bars
set go-=R
set go-=l
set go-=L
set lines=60 columns=85   " taille de la fenêtre au démarrage

set lazyredraw

hi ExtraWhitespace guibg=red ctermbg=red

hi VimwikiHeader1 guifg=#FF0000
hi VimwikiHeader2 guifg=#00FF00
hi VimwikiHeader3 guifg=#0000FF
hi VimwikiHeader4 guifg=#FF00FF
hi VimwikiHeader5 guifg=#00FFFF
hi VimwikiHeader6 guifg=#FFFF00
