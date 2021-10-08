" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif


if has('win32')
  if has('nvim')
    Guifont UbuntuMono\ NF:h10
  else
    set guifont=UbuntuMono\ NF:h8:cANSI:qDRAFT
  endif
else " Unix
  if has('nvim')
    Guifont UbuntuMono Nerd Font:h14
  else
    set guifont=UbuntuMono\ Nerd\ Font\ 14
  endif
endif

set guioptions-=T                  " ne pas afficher la toolbar
set guioptions-=m                  " ne pas afficher la menubar
set guioptions-=r                  " do not show vertical bars
set guioptions-=R
set guioptions-=l
set guioptions-=L
set lines=60 columns=85   " taille de la fenêtre au démarrage

set lazyredraw


hi VimwikiHeader1 guifg=#FF0000
hi VimwikiHeader2 guifg=#00FF00
hi VimwikiHeader3 guifg=#0000FF
hi VimwikiHeader4 guifg=#FF00FF
hi VimwikiHeader5 guifg=#00FFFF
hi VimwikiHeader6 guifg=#FFFF00
