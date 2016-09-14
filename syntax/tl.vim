" TimeLine files syntax highlighting for Vim

if exists ("b:current_syntax")
  finish
endif

runtime! syntax/python.vim

syn keyword tlKeyword   source clock timeline frame drawsheet copy timemark
syn keyword tlKeyword   arrow
syn keyword tlSpecial   FILENAME
syn region  tlParenthesis start="(" end=")" contains=tlParam,pythonString,tlParenthesis,tlKeyword
syn match   tlParam     "\<\h\w*\>\(\s\|\n\)*="me=e-1 contained

hi def link tlKeyword    Keyword
hi def link tlParam      Identifier
hi def link tlSpecial    Special

let b:current_syntax="tl"
