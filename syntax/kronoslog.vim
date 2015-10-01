" Kronos changelog syntax highlighting for Vim


syn keyword component KITE TAKO KOFE PSYKO KOMMON KOBE K2 RESOURCES KRONOS
syn match   product   '^  .*:$'
syn match   jira      '\[.*\]'
syn match   commit    '- .*'
syn match   empty     "-- No changes --"

hi def link component Keyword
hi def link product   Type
hi def link jira      Comment
hi def link empty     Identifier
