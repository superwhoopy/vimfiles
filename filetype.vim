" Vim support file to detect file types

" Listen very carefully, I will say this only once
if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  au BufRead,BufNewFile *.gcov     set filetype=gcov
  au BufRead,BufNewFile *.md       set filetype=markdown
  au BufRead,BufNewFile git-ci.tmp set filetype=gitcommit
  au BufRead,BufNewFile *.cmm      set filetype=practice
augroup END
