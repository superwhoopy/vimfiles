if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

" Silent rebuild on save
nnoremap <C-S> :w<CR>:Make!<CR>
