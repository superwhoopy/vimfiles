" Vim support file to detect file types
"
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last Change: 2008 Aug 03

" Listen very carefully, I will say this only once
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au BufRead,BufNewFile *.gcov     set filetype=gcov
  au BufRead,BufNewFile *.md       set filetype=markdown
  au BufRead,BufNewFile git-ci.tmp set filetype=gitcommit
augroup END
