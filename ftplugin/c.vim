" PAIRED CHARACTERS & SEQS
" Parenthesis
" inoremap <buffer>    (       ()<Left>
" inoremap <buffer>   <expr>) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" Single- and Double-quotes
" inoremap <buffer>    "       ""<Left>
" Brackets
inoremap <buffer>    [       []<Left>
inoremap <buffer>    <expr>] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <buffer>    {       {}<Left>
inoremap <buffer>    <expr>} strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <buffer>    {<CR>   {<CR>}<Esc>O<Tab>
inoremap <buffer>    /*      /**/<Left><Left>



" COMMENTS

" Comment out a line
nnoremap <buffer> <C-c>   I/* <Esc>A */<Esc>
nnoremap <buffer> <C-x><C-c>   ^3x$xxx

" Inserts a line of /*** ... ***/
"nmap    <buffer> <C-l>   o/<Esc>78a*<Esc>a/<Esc>j
imap    <buffer> <C-l>   /<Esc>78a*<Esc>a/
" Frame comment
"nmap    <buffer> <C-f> O/a*77.a/yypO/*a 75.a*/<Esc>^lll
imap    <buffer> <C-f> /a*77.a/yypO/*a 75.a*/<Esc>^lllR
" To-do sequence
"nmap    <buffer> <C-q> o/*! TODO */<Esc>bb
imap    <buffer> <C-q> /*! TODO */
" Empty comment
"nmap    <buffer> <C-a> cc/*  */<Esc>2hi


" DOXYGEN header
imap    <buffer> <C-h>   /*!<CR><Esc>!!echo %<CR>I * \file<Tab><Esc>o\brief<Tab>TODO<CR>/<Esc>k3w
" C header symbol protector
imap    <buffer> <C-n> o!!echo $(basename %)VUV:s/\./_/gi:nohI__A__yyI#ifndef o#define pkJo#endif pk$Ji/* A */


" INCLUDES
"nmap    <buffer> <C-c>  o#include <><Left>
imap    <buffer> <C-c>  #include <><Left>

