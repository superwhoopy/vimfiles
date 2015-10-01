if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore


" storage types
syn match asmType "\.long"
syn match asmType "\.ascii"
syn match asmType "\.asciz"
syn match asmType "\.byte"
syn match asmType "\.double"
syn match asmType "\.float"
syn match asmType "\.hword"
syn match asmType "\.int"
syn match asmType "\.octa"
syn match asmType "\.quad"
syn match asmType "\.short"
syn match asmType "\.single"
syn match asmType "\.space"
syn match asmType "\.string"
syn match asmType "\.word"

syn match asmIdentifier		"[a-z_][a-z0-9_]*"

" Various #'s as defined by GAS ref manual sec 3.6.2.1
" Technically, the first decNumber def is actually octal,
" since the value of 0-7 octal is the same as 0-7 decimal,
" I prefer to map it as decimal:
syn match decNumber		"0\+[1-7]\=[\t\n$,; ]"
syn match decNumber		"[1-9]\d*"
syn match octNumber		"0[0-7][0-7]\+"
syn match hexNumber		"0[xX][0-9a-fA-F]\+"
syn match binNumber		"0[bB][0-1]*"


syn match asmSpecialComment	";\*\*\*.*"
syn match asmComment		";.*"

syn match asmInclude		"\.include"
syn match asmCond		"\.if"
syn match asmCond		"\.else"
syn match asmCond		"\.endif"
syn match asmMacro		"\.macro"
syn match asmMacro		"\.endm"


syn match asmDirective		"\.[a-z][a-z1-9_]\+"

syn region	cString		start=+L\="+ skip=+\\\\\|\\"+ end=+"+

" CPP directives
syn region	cIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	cIncluded	display contained "<[^>]*>"
syn match	cInclude	"^\s*\$*\(%:\|#\)\s*include\>\s*["<]" contains=cIncluded
syn region	cDefine		start="^\s*\$*\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" end="//" contains=asmCcomment
syn region	cPreCondit	start="^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" end="//" contains=asmCcomment,cCppString,cCharacter,cCppParen,cNumbers
syn match	cPreCondit	display "^\s*\(%:\|#\)\s*\(else\|endif\)\>"

" *****************************************************************************

" ARM instructions
syn keyword asmARMinst msr mrs cmp tst nop
syn keyword asmARMinst orr
syn match   asmARMinst /\<\(ldm\|stm\)\(ia\|fd\|ib\|da\|db\)\?\>/ " LDM/STM instruction
syn match   asmARMinst /\<\(mov\|sub\|add\)\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|ls\|ge\|lt\|gt\|le\|al\)\(s\)\?\>/ " MOV/SUB/ADD instruction
syn match   asmARMinst /\<\(lsl\|lsr\)\(s\)\?\>/
syn match   asmARMinst /\<\(and\|eor\|orr\)\(s\)\?\>/
syn match   asmARMinst /\<b\(l\|x\|ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|ls\|ge\|lt\|gt\|le\|al\)\?\>/ " Branch instruction
syn match   asmARMinst /\<\(ldr\|str\)\(ne\|eq\|cs\|hs\|cc\|lo\|mi\|pl\|ls\|ge\|lt\|gt\|le\|al\)\?\>/

"ARM registers
syn match   asmARMreg  /\<r\([0-9]\|1[0-4]\)\>/
syn match   asmARMreg  /\<\(cp\|sp\)sr\(_c\?x\?s\?f\?\)\?\>/
syn keyword asmARMreg  pc sp lr ip fp

" IA(Intel) instructions
syn match   asmIAinst /\<\(movs\?\|sub\|x\?add\|push\|pop\|cmp\|xor\)\(l\|w\|b\)\?\>/
syn match   asmIAinst /\<\(or\|pusha\|popa\|pushf\|lea\|out\|in\)\(l\|w\|b\)\?\>/
syn match   asmIAinst /\<\(and\|dec\|inc\)\(l\|w\|b\)\?\>/
syn match   asmIAinst /\<j\(mp\|e\|ne\|c\|nz\|z\|ae\|g\|l\)\>/
syn match   asmIAinst /\<bt\(s\|r\|l\)\>/
syn match   asmIAinst /\<sh\(r\|l\)\>/
syn match   asmIAinst /\<\(rd\|wr\)msr\>/
syn keyword asmIAinst lfence sfence rfence ret iret int call bts btr out in test
syn keyword asmIAinst cli sti imul frstor fnsave clc lgdt ljmp lssl lidt finit fsave ltr
syn keyword asmIAinst cpuid leave pause lock rep rdtsc xchg wbinvd ljmpl

" IA(Intel) registers
syn match asmIAreg     /%[c-gs]s/
syn match asmIAreg     /%e\?[a-d]x/
syn match asmIAreg     /%[a-d]l/
syn match asmIAreg     /%e\?\(b\|s\)p/
syn match asmIAreg     /%e\?\(d\|s\)i/
syn match asmIAreg     /%cr\(0\|2\|3\|4\)/

"Const
syn match   asmARMconst /=[a-z].\+/
syn match   asmIAconst  /$\([a-z]\|[0-9]\|_\)\+/

" Labels
syn match asmLabel      /[0-9]\+\(f\|b\|:\)/
syn match asmLabel		"[a-z_][a-z0-9_]*:"he=e-1

" Comments
syn match  Comment          /@.*/ contains=todoTag
syn region asmCcomment      start="\/\*" end="\*\/" contains=todoTag
syn keyword	todoTag		contained TODO FIXME XXX

" *****************************************************************************
" HIGHLIGHTING
" *****************************************************************************

syn case match

hi link asmARMinst ModeMsg
hi link asmARMreg Type 
hi link asmARMconst Constant 

hi link asmIAinst ModeMsg
hi link asmIAreg Type 
hi link asmIAconst Constant 

hi link todoTag Todo

hi link asmSection	Special
hi link asmLabel	Label
hi link asmComment	Comment
hi link asmDirective	Statement

hi link asmInclude	Include
hi link asmCond	PreCondit
hi link asmMacro	Macro

hi link hexNumber	Number
hi link decNumber	Number
hi link octNumber	Number
hi link binNumber	Number

hi link asmSpecialComment Comment
hi link asmCcomment     Comment
hi link asmIdentifier   Normal
hi link asmType	Type

" C/CPP inherited highlighting
hi link cString     String
hi link cIncluded   String
hi link cInclude    Include
hi link cDefine     Macro
hi link cPreCondit  PreCondit


let b:current_syntax = "asm"

" vim: ts=8
