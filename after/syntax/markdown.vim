" highlight the content of code blocks
hi def link markdownCode                  Special

" conceal single backticks as well
let s:concealends = ''
if has('conceal') && get(g:, 'markdown_syntax_conceal', 1) == 1
  let s:concealends = ' concealends'
endif
exe 'syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" keepend contains=markdownLineStart' . s:concealends

" enable concealing
set conceallevel=2
