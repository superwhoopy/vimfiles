
" TimeLine files syntax highlighting for Vim
" This is a generated file: you probably don't want to modify it

if exists ("b:current_syntax")
  finish
endif

runtime! syntax/python.vim

syn keyword tlKeyword   source clock timeline tick frame arrow textbox setdefaults getdefaults backendopts anchor parallelarrow fracclock fractick leftdoublearrow leftarrow rightdoublearrow rightarrow updoublearrow uparrow downdoublearrow downarrow overdoublearrow overarrow underdoublearrow underarrow
syn keyword tlSpecial   DEFAULTS visible_frames add_ticks tickat dates visible_ticks add_frames visible_textboxes add_textboxes DEFAULTS add_arrows t_mingap t_end t_start add_timelines gap_gcd ROOT_OBJECTS sorted_dates add_timemarks
syn region  tlParenthesis start="(" end=")" contains=tlParam,pythonString,tlParenthesis, tlComment,tlKeyword,tlSpecial
syn match   tlParam     "\<\h\w*\>\(\s\|\n\)*="me=e-1 contained
syn match   tlComment     "#.*$"

hi def link tlKeyword    Keyword
hi def link tlParam      Identifier
hi def link tlSpecial    Special
hi def link tlComment    Comment

let b:current_syntax="tl"
