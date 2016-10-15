" psyko debug log output highlighting for Vim

if exists ("b:current_syntax")
  finish
endif

syn match   logHeader '^\(\w\+>\)*'
syn region  logString start='"'   end='"\|\n' skip='\\"'
syn region  logStringSquote start="'"   end="'\|\n"

hi def link logType   Keyword
hi def link logHeader Type
hi def link logString String
hi def link logStringSquote String

let b:current_syntax="psykolog"
