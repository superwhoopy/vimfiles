" LaTeX Math Cmd
inoremap <F5> :math:``<Esc>i
" Verbatim Text
inoremap <F4> ````<Esc>hi
vnoremap <F4> s`vf`s`3f`

set makeprg=mkdir\ -p\ html\ ;\ rst2html\ %\ >\ html/index.html

command! Rst2latex   !mkdir -p tex && rst2latex % > tex/main.tex && cd tex/ && pdflatex main.tex ; pdflatex main.tex ; cd ..

" Automatic paragraph formatting 
" set fo+=a
