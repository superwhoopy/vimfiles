
" TimeLine files syntax highlighting for Vim
" This is a generated file: you probably don't want to modify it

if exists ("b:current_syntax")
  finish
endif

runtime! syntax/python.vim

syn keyword tlKeyword   source clock timeline tick frame arrow textbox backendopts getdefaults setdefaults
syn keyword tlSpecial   tickat add_frames add_ticks visible_textboxes add_textboxes visible_ticks dates DEFAULTS visible_frames DEFAULTS add_timemarks add_timelines add_arrows t_mingap t_start t_end ROOT_OBJECTS gap_gcd sorted_dates
syn region  tlParenthesis start="(" end=")" contains=tlParam,pythonString,tlParenthesis, tlComment,tlKeyword,tlSpecial
syn match   tlParam     "\<\h\w*\>\(\s\|\n\)*="me=e-1 contained
syn match   tlComment     "#.*$"

hi def link tlKeyword    Keyword
hi def link tlParam      Identifier
hi def link tlSpecial    Special
hi def link tlComment    Comment

let b:current_syntax="tl"
