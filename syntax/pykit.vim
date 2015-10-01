
" KIT files syntax highlighting for Vim
"
" Simply sources the original Python syntax highlighting script of vim then
" extends it with KIT syntax.
"
" TODO: make a generic syntax script that sources the appropriate syntax file
" according to the file extension, e.g. .py.kit --> source python.vim then
" kit.vim

if exists ("b:current_syntax")
  finish
endif

runtime! syntax/python.vim
unlet b:current_syntax

:runtime! syntax/kit.vim

let b:current_syntax="pykit"
