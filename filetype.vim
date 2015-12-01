" Vim support file to detect file types
"
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last Change: 2008 Aug 03

" Listen very carefully, I will say this only once
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au BufRead,BufNewFile *.psy      set filetype=psy
  au BufRead,BufNewFile *.psyh     set filetype=psy
  au BufRead,BufNewFile *.otl      set filetype=otl
  au BufRead,BufNewFile *.gcov     set filetype=gcov
  au BufRead,BufNewFile *.md       set filetype=markdown
  au BufRead,BufNewFile *.h.kit    set filetype=ckit
  au BufRead,BufNewFile *.kit      set filetype=kit
  au BufRead,BufNewFile psykolog   set filetype=psykolog
  au BufRead,BufNewFile psyko.log  set filetype=psykolog
  au BufRead,BufNewFile *.psykolog set filetype=psykolog
  au BufRead,BufNewFile git-ci.tmp set filetype=gitcommit
augroup END
