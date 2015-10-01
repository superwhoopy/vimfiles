" KIT files syntax highlighting for Vim
"
" TODO This will only work with syntax files which have the same name than the
" extension, such as .c, .xml or .html files. But it won't work with .h or .py
" files... Find a workaround?
"function! s:GetSubextension()
"  let l:filename=split( expand('%'), '\.')
"  return l:filename[len(l:filename)-2]
"endfunction
"let b:syntaxfile = "syntax/" . s:GetSubextension() . ".vim"

if exists ("b:current_syntax")
  finish
endif

syn keyword kitKeyword   contained for if in range select by with kit else
syn keyword kitKeyword   contained and or not exists is_last count filter split
syn keyword kitKeyword   contained int float bool true false let ignore br
syn keyword kitKeyword   contained apply ifempty assert rationale template ref
syn keyword kitKeyword   contained include
syn keyword kitType      contained lang_version database
syn region  kitDirective start="\(\[%\)\|\(<%\)" end="\(%>\)\|\(%\]\)"  contains=kitKeyword,kitString
syn region  kitEval      start="[<[]%=" end="%>\|%]" contains=kitKeyword,kitString
syn region  kitComment   start="\(<%%\)\|\(\[%%\)" end="%%>"
syn region  kitString    start='"'   end='"' skip='\\"'  contains=kitSpecial
syn match   kitSpecial   '%[sif]'

hi def link kitKeyword    Keyword
hi def link kitDirective  PreProc
hi def link kitType       Type
hi def link kitEval       Identifier
hi def link kitComment    Comment
hi def link kitString     String
hi def link kitSpecial    Special

let b:current_syntax="kit"
