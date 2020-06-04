if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

" auto-close brackets and double quotes (+ formatting)
inoremap <buffer> {  {<CR>}<Esc>O
inoremap <buffer> [  [<CR>]<Esc>O
inoremap <buffer> "  ""<Left>

