" Vim support file to detect file types

" Listen very carefully, I will say this only once
if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  au BufRead,BufNewFile *.gcov     setfiletype=gcov
  au BufRead,BufNewFile *.md       setfiletype=cpp
  au BufRead,BufNewFile git-ci.tmp setfiletype=gitcommit
  au BufRead,BufNewFile *.cmm      setfiletype=practice
augroup END
