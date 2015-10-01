" KIT files syntax highlighting for Vim
"
" Simply sources the original tak syntax highlighting script of vim then extends
" it with KIT syntax.

if exists ("b:current_syntax")
  finish
endif

runtime! syntax/tak.vim
unlet b:current_syntax

:runtime! syntax/kit.vim

let b:current_syntax="takit"
