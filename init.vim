set encoding=utf-8
scriptencoding utf8
" Leader key is ','
let mapleader=','

:lua << HEREDOC
-- bootstrap lazy.nvim if not available
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load all plugins and configuration: see lua/packages.lua
require('lazy').setup(
    require('packages').plugins,
    {performance={rtp={reset=false}}}
)
HEREDOC

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark

" Vim options
set hlsearch               " highlight search result
set ignorecase             " ignore case
set incsearch              " incremental search
set number                 " print line numbers
set shiftwidth=2           " TAB equals 2 spaces
set tabstop=2              " ...probably the same thing
set expandtab              " use spaces, not tabs
set autoindent             " auto-indentation
set textwidth=80           " default text width: 80 chars
set colorcolumn=+1,+2,+3   " light up the 80-th column
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
set wrap                   " Wrap if the line extends...
set shortmess=Aat          " short messages: do not prompt warning message if
                           " the file is already opened, and truncate "open
                           " file" messages
set autoread               " re-read the file if it is modified externally
" set foldcolumn=1           " colonne de gauche pour indiquer les zones
                           " \"foldables\"
set scrolloff=3            " toujours afficher au moins 3 lignes au dessus et
                           " en dessous du curseur
set modeline               " autoriser les modlines
set foldmethod=indent      " Folding base sur l'indentation
set foldlevelstart=100    " deplier tous les folds jusqu'au nv. 100
set diffopt+=iwhite        " en mode 'diff', ignorer les espaces
set nojoinspaces           " don't add extra whitespace when formatting
set switchbuf=uselast      " when opening quickfix item, use the last buffer

" visual autocomplete for command menu
set wildmenu
set wildignore=*/.git/*,*.o,*.obj,*.lib,*.a,*.pyc,*/__pycache__/*
"
" Height of the preview window (24=twice default size)
set previewheight=24

" Default copy/paste from system clipboard
set clipboard=unnamed,unnamedplus

" Enable French and English spelling languages by default
set spelllang=en_us,fr

" Have a gui-like rendering even in terminal
set termguicolors

" always have a status line for each window
set laststatus=2

" set colorscheme once in this variable, and use it for all plugins that require
" it
" let s:colorscheme = 'everforest'
" let s:colorscheme = 'gruvbox'
let s:colorscheme = 'tokyonight'
execute("colorscheme " . s:colorscheme)

" Show tabs, trailing and non-breakable spaces
set list
set listchars=tab:>\ ,trail:-,nbsp:·

" set exrc, so that .exrc files are automatically sourced (see :help exrc)
set exrc

if has('win32')
  " Windows dark magic to make the backspace key work properly...
  set backspace=2
  set noshellslash
  set shell=cmd.exe
endif

"###############################################################################
" SOURCE LOCAL VIMRC FILE COMPLEMENT
"###############################################################################
" this file is not versioned, and is local to the machine
let s:local_vimrc = expand('<sfile>:p:h') . '/localrc.vim'
if filereadable(s:local_vimrc)
    execute("source " . s:local_vimrc)
endif

"###############################################################################
" SOURCE LUA FILE
"###############################################################################
let s:init_lua = expand('<sfile>:p:h') . '/lua/init.lua'
execute("luafile " . s:init_lua)

"###############################################################################
" MAPPINGS AND COMMANDS
"###############################################################################

" Move across visual lines inside wrapped long lines
nnoremap k gk
nnoremap j gj

" map 'jj' to escape insert mode
inoremap jj    <Esc>

" Build a Ctags file
command! MkTags call utils#MkTags()

" Switch to markdown mode: no 80 chars, linebreak
command! Markdown set ft=markdown tw=0 linebreak

" Change to the directory of the current file
command! Cd     cd\ %:p:h

" Toggle auto-format option with <Leader>fo
noremap <Leader>fo <Cmd>call utils#ToggleAutoFormat()<CR>

" Window navigation: map <Alt-[hjkl]> to 'move around' instructions, in normal
" and insertion mode. Also handle the case of terminal emulators that convert
" keystroke <A-l> into l for some reason...
for s:key in ['h', 'j', 'k', 'l']
    execute('nnoremap <A-' . s:key . '> :wincmd ' . s:key . '<CR>')
    execute('inoremap <A-' . s:key . '> '
                \ . '<Esc>:wincmd ' . s:key . '<CR>a')
endfor

" Quickly edit vimrc
nmap <F8> <Cmd>e ~/.vim/init.vim<CR>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>

" Align what remains of the line to the right, according to textwidth. Mapped to
" command :AlignRight, and to <A-Right>
command! AlignRight call utils#AlignRightFrom(getline('.'), getpos('.')[2] - 1,
            \                           &textwidth)
inoremap <A-Right> <Cmd>AlignRight<CR>

" clear all buffers but the one active
command! ClearBufs call utils#DeleteAllBuffersButCurrent()

" terminal configuration -------------------------------------------------------

if has('win32')
    " shorthand command to spawn a terminal with my zsh shell - need to define a
    " msys2.cmd command somewhere in the PATH that does what's necessary
    command! Terminal execute('terminal msys2')
endif

" telescope mappings -----------------------------------------------------------

" Ctrl+P to find files
nnoremap <C-p> <Cmd>lua require('telescope.builtin').fd()<CR>
" Ctrl+Shift+P to find tags
nnoremap <C-S-p> <Cmd>lua require('telescope.builtin').tags()<CR>
" Ctrl+Shift+G to grep into directory (Ctrl+G displays file name)
nnoremap <C-S-g> <Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
" Ctrl + B to browse openned buffers
nnoremap <C-b> <Cmd>lua require('telescope.builtin').buffers({sort_mru=true})<CR>
" Ctrl + N to browse files from CWD
nnoremap <C-n>
            \ <Cmd>lua require('telescope').extensions.file_browser.
            \ file_browser({respect_gitignore=false,
            \ layout_config={bottom_pane={height=80}}})<CR>
" Ctrl + Shift + N to browse files from the current buffer
nnoremap <C-S-n>
            \ <Cmd>lua require('telescope').extensions.file_browser.
            \ file_browser({path='%:p:h', select_buffer=true,
            \               respect_gitignore=false,
            \               layout_config={bottom_pane={height=80}}})<CR>


" <Leader>g to grep the word under the cursor
nnoremap <Leader>g <Cmd>lua require('telescope.builtin').grep_string()<CR>

" <Leader>D to show diagnostics
nnoremap <Leader>D <Cmd>lua require('telescope.builtin').diagnostics()<CR>



"###############################################################################
" AUTO-COMMANDS AND FILETYPE-SPECIFIC STUFF
"###############################################################################

augroup vimrc
    autocmd!
    " file type personal preferences
    autocmd FileType markdown setlocal spell
    autocmd FileType rst      setlocal spell
    autocmd FileType vim      setlocal tabstop=4 shiftwidth=4

    " auto-resize all windows when GUI or term is resized
    autocmd VimResized * wincmd =

    " disable trailing whitespaces highlighting in terminal windows
    autocmd TermOpen * DisableWhitespace
    " enter insertion mode immediately when opening/focusing the terminal
    autocmd BufWinEnter,WinEnter term://* startinsert

    autocmd User StartifyBufferOpened
                \ lua require('utils').run_exrc(vim.fn.getcwd())
augroup END



"###############################################################################
" PLUGINS CONFIGURATION
"###############################################################################

" PlantUML #####################################################################
let g:plantuml_executable_script='plantuml -o out/'

" Better Wihtespaces ###########################################################

hi ExtraWhitespace guibg=red ctermbg=red

" Strip trailing whitespaces
nmap <F10>  <Cmd>StripWhitespace<CR>

" auto-strip trailing whitespaces on save
let g:strip_whitespace_on_save = 0
let g:strip_whitespace_confirm = 0

" python-syntax ################################################################

" enable Python highlighting plugin
let g:python_highlight_all = 1


" EasyAlign ####################################################################

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" custom delimiters
let g:easy_align_delimiters = {
  \   '\': { 'pattern': '\\' }
  \ }


" surround #####################################################################

" use 's' instead of 'S' for surrounding in visual mode (undocumented <Plug>
" stuff: just read the source code)
xmap   s <Plug>VSurround

" ALE ##########################################################################

set omnifunc=ale#completion#OmniFunc
let g:ale_c_parse_compile_commands = 1
let g:ale_completion_enabled = 1
let g:ale_c_build_dir_names = ['out/Debug']
let g:ale_linters = {
            \ 'cpp' : ['g++'],
            \ 'c' : ['gcc'],
            \ 'sh': ['shellcheck'],
            \ 'haskell': ['hls', 'ghc'],
            \ 'python': [],
            \ }

" vim-asterios #################################################################

if has('unix')
    let s:core_sdk = expand('~/workspace/core/out/Debug/sdk')
    let g:ast_psyko_path = s:core_sdk . '/bin/psyko'
    let g:ast_kernel_dir = s:core_sdk . '/k2'

    let g:ale_json_vscode_ls = expand('/usr/bin/vscode-json-languageserver')
    let g:ale_psy_psyko_jsonconf =
        \ [expand('~/.vim/plugged/vim-asterios/tests/psy/flags.psymodule.json')]

elseif has('win32')

    let s:ks_root = expand('F:\Programs\Krono-Safe')
    let g:ast_psyko_path = s:ks_root . '\psyko-8.13.1\bin\psyko.exe'
    let g:ast_kernel_dir = s:ks_root . '\rtk-power-mpc5777m-module-4.4.3'
    let g:ast_product_name = 'power-mpc5777m-module'

endif

" WebDevIcons and NERDTree coloring stuff
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
            \ 'psy': 'Ψ',
            \ 'bgt': '祥',
            \ }

" Startify #####################################################################

let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_commands = [
    \ ['New Mail',     'execute("edit " . tempname() . ".txt") | set ft=mail'],
    \ ['New Markdown', 'execute("edit " . tempname() . ".md")'],
    \ ['Terminal', 'Terminal'],
    \ ]

" Load Startify bookmarks from file; create an empty bookmarks file if it does
" not exist
let s:startify_bookmarks_file = expand('<sfile>:p:h') . '/startify.bookmarks'
if !filereadable(s:startify_bookmarks_file)
    call writefile([], s:startify_bookmarks_file)
endif
let g:startify_bookmarks = readfile(s:startify_bookmarks_file)
" quickly edit the file that stores startify bookmarks
command! StartifyEditBookmarks execute('edit ' . s:startify_bookmarks_file)

" LSP servers ##################################################################

:lua << EOF
EOF

" pretty signs
sign define DiagnosticSignError text=🔴 texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text=⚠ texthl=DiagnosticSignWarn linehl= numhl=
sign define DiagnosticSignInfo text=ℹ texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignHint text=👉 texthl=DiagnosticSignHint linehl= numhl=

" vim-vsnip ####################################################################
imap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

" vim-highlighter
nnoremap <C-CR> <Cmd>Hi><CR>
nnoremap <S-CR> <Cmd>Hi<<CR>
nnoremap [<CR>  <Cmd>Hi{<CR>
nnoremap ]<CR>  <Cmd>Hi}<CR>
let g:HiSyncMode = 1 " highlight across windows
