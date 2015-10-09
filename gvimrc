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

" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/gvimrc
" if filereadable("/etc/vim/gvimrc.local")
"   source /etc/vim/gvimrc.local
" endif

":set bg=light               " background general color tone
:set bg=dark
":set guifont=Neep\ 11
":set guifont=Consolas:h8:cANSI
:set guifont=Monospace\ 8
" :colors morning
":colors desert
colorscheme solarized
:set go-=T                  " ne pas afficher la toolbar
:set go-=m                  " ne pas afficher la menubar
:set lines=60 columns=85   " taille de la fenêtre au démarrage
" :set mousefocus             " le curseur de la souris donne le focus

" Set shellslash, so that path with '/' instead of '\' can be used
:set ssl

hi ExtraWhitespace guibg=red ctermbg=red
