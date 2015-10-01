" Vim filetype detection file
" Language:	Txt2tags (http://hogbaysoftware.com/projects/taskpaper)
augroup t2t
     au! BufRead,BufNewFile *.t2t   setfiletype txt2tags
augroup END
