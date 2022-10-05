" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

if has('win32')
    let s:fontname = "UbuntuMono\\ NF"
    let s:fontsize = 8
else " Unix
    let s:fontname = "UbuntuMono\\ Nerd\\ Font"
    let s:fontsize = 14
endif

function! SetFont()
    if has('nvim')
        execute("GuiFont! " . s:fontname . ":h" . s:fontsize)
    else
        execute("set guifont=" . s:fontname . ":h" . s:fontsize)
    endif
endfunction

function! AdjustFontSize(amount)
    let s:fontsize = s:fontsize + a:amount
    call SetFont()
endfunction


call SetFont()

set guioptions-=T                  " ne pas afficher la toolbar
set guioptions-=m                  " ne pas afficher la menubar
set guioptions-=r                  " do not show vertical bars
set guioptions-=R
set guioptions-=l
set guioptions-=L
set lines=60 columns=90   " taille de la fenêtre au démarrage

set mouse=a " enable mouse support

" adjust font size
nnoremap <C-=> :call AdjustFontSize(1)<CR><C-W>=
nnoremap <C--> :call AdjustFontSize(-1)<CR><C-W>=
