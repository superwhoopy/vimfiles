set sw=2

" imap <buffer> é  \'e
" imap <buffer> è  \`e
" imap <buffer> ê  \^e
" imap <buffer> à  \`a
" imap <buffer> ù  \`u
" imap <buffer> ç  \c c
" imap <buffer> â  \^a
" imap <buffer> ô  \^o
" imap <buffer> û  \^u
" imap <buffer> ï  \"i

imap <buffer>  <leader>toto <Plug>Tex_InsertItemOnThisLine

setlocal grepprg=grep\ -nh\ $*
set iskeyword+=:
set iskeyword+=\
set winaltkeys=yes

" Enable spell checking by default in English
set spelllang=en
set spell

" No auto-wrap at textwidth
set fo-=t
" Long lines shall not be broken in insert mode
set fo+=l
" Do not break lines in the middle of a word
set linebreak
" Character to indicate a wrapped-line contd.
set showbreak=>\ 
" No colorcolumn
set colorcolumn=0

