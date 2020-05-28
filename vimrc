set encoding=utf-8
scriptencoding utf8
filetype off

let g:ale_completion_enabled = 1

call plug#begin()

Plug 'cespare/vim-toml'
Plug 'davidhalter/jedi-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'drmikehenry/vim-fontsize'
Plug 'editorconfig/editorconfig-vim'
Plug 'garbas/vim-snipmate'
Plug 'hiphish/jinja.vim'
Plug 'hjson/vim-hjson'
Plug 'jlanzarotta/bufexplorer'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-syntax-extra'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'krono-safe/vim-asterios'
Plug 'Lokaltog/vim-easymotion'
Plug 'm42e/trace32-practice.vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ngg/vim-gn'
Plug 'ntpeters/vim-better-whitespace'
Plug 'romainl/flattened' " Solarized without bullshit
Plug 'preservim/nerdtree'
Plug 'shime/vim-livedown'
Plug 'tmhedberg/SimpylFold' " better Python folding
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/DrawIt'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'zchee/vim-flatbuffers'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

if has('win32')
  Plug 'kkoenig/wimproved.vim'
endif

call plug#end()

filetype plugin indent on

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on
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
set colorcolumn=81         " light up the 80-th column
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

" visual autocomplete for command menu
set wildmenu
set wildignore=*/.git/*,*.o,*.obj,*.lib,*.a,*.pyc,*/__pycache__/*
"
" Height of the preview window (24=twice default size)
set previewheight=24
"
" Default copy/paste from system clipboard
set clipboard=unnamed

" Enable French and English spelling languages by default
set spelllang=en_us,fr

" Leader key is ','
let mapleader=','

if has('win32')
  " Windows dark magic to make the backspace key work properly...
  set backspace=2
  set noshellslash

  if !has('nvim')
    " Python DLL to look for on Windows
    set pythonthreedll=python36.dll
    set pythonthreehome="C:\Program Files\Python36"
  endif
else
  set shell=/bin/bash
endif

"###############################################################################
" MAPPINGS AND COMMANDS
"###############################################################################

" Mappings
" Ouvrir le Buffer explorer avec la touche F12
nnoremap <F12> :BufExplorer<CR>

" Ctrl-S : sauvegarder fichier courant, meme en mode edition
inoremap <C-s> <Esc>:w<CR>a
noremap  <C-s> :w<CR>:echo "File saved."<CR>

" <C-Space> for omnicompletion
inoremap <C-Space> <C-X><C-o>

" Tag navigation
noremap <C-Tab>   <C-]>
noremap <C-S-Tab> :ptag <C-R><C-W><CR>

" Move across visual lines inside wrapped long lines
nnoremap k gk
nnoremap j gj

" map 'jk' to escape insert mode - and disable Esc, just to learn
inoremap jk    <Esc>
inoremap <Esc> <Nop>

" Build a Ctags file
command! MkTags call utils#MkTags()

" Change to the directory of the current file
command! Cd     cd\ %:p:h

" Diffmode switch
noremap <A-d>  :call utils#DiffSwitch()<CR>
" Run git diff on the current file
noremap <Leader>d :Gvdiff<CR>

" Toggle auto-format option with <Leader>fo
noremap <Leader>fo :call utils#ToggleAutoFormat()<CR>

" Window navigation
nnoremap <A-l> :wincmd l<CR>
nnoremap <A-k> :wincmd k<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <A-h> :wincmd h<CR>

" Quickly edit vimrc
nmap <F8> :e ~/.vim/vimrc<CR>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>


"###############################################################################
" AUTO-COMMANDS AND FILETYPE-SPECIFIC STUFF
"###############################################################################

augroup vimrc_filetypes
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd FileType rst      setlocal spell
  autocmd FileType vim      setlocal tabstop=4 shiftwidth=4
augroup END


"###############################################################################
" PLUGINS CONFIGURATION
"###############################################################################

" Taglist ######################################################################

let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1


" NERDTree #####################################################################

let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.a$', '\.gcno$', '__pycache__',
  \ '\.pyc$', '\.egg-info$']


" NERDTree Syntax Highlighting #################################################

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name


" CtrlP ########################################################################

" default is 'ra', which causes madness when using git submodules
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore= '\v[\/]\.o$\|\v[\/]\.obj$\|\v[\/]\.pyc$\|\v[\/]\.sbr$'


" SnipMate #####################################################################

imap <C-Tab> <Plug>snipMateNextOrTrigger
smap <C-Tab> <Plug>snipMateNextOrTrigger


" Better Wihtespaces ###########################################################

hi ExtraWhitespace guibg=red ctermbg=red

" Strip trailing whitespaces
nmap <F10>  :StripWhitespace<CR>

" auto-strip trailing whitespaces on save
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0


" vimwiki ######################################################################

let g:vimwiki_list = [
  \   {'maxhi'                     : 0,
  \    'css_name'                  : 'style.css',
  \    'auto_export'               : 0,
  \    'diary_index'               : 'diary',
  \    'template_default'          : 'default',
  \    'nested_syntaxes'           : {'python': 'python', 'c++': 'cpp',
  \                                   'c': 'c', 'psy': 'psy'},
  \    'auto_toc'                  : 1,
  \    'auto_tags'                 : 0,
  \    'diary_sort'                : 'desc',
  \    'path'                      : '~/vimwiki/',
  \    'diary_link_fmt'            : '%Y-%m-%d',
  \    'template_ext'              : '.tpl',
  \    'syntax'                    : 'default',
  \    'custom_wiki2html'          : '',
  \    'automatic_nested_syntaxes' : 1,
  \    'index'                     : 'index',
  \    'diary_header'              : 'Diary',
  \    'ext'                       : '.wiki',
  \    'path_html'                 : '~/vimwiki_html/',
  \    'temp'                      : 0,
  \    'template_path'             : '~/vimwiki/templates/',
  \    'list_margin'               : -1,
  \    'diary_rel_path'            : 'diary/'
  \    }]
nmap <Leader>ww <Plug>VimwikiIndex:VimwikiGenerateTags<CR>
nmap <Leader>wi <Plug>VimwikiDiaryIndex:VimwikiDiaryGenerateLinks<CR>



" Airline ######################################################################

" airline stuff
let g:airline_theme='simple'
" short ids for mode
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }
" truncate those fields early
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 88,
    \ 'y': 88,
    \ 'z': 88,
    \ 'warning': 80,
    \ 'error': 80,
    \ }

" use powerline fonts
let g:airline_powerline_fonts = 1

" show git diff hunks count only if nonzero
let g:airline#extensions#hunks#non_zero_only = 1

" enable YouCompleteMe status
let g:airline#extensions#ycm#enabled = 1

" enable ALE status
let g:airline#extensions#ale#enabled = 1


" python-syntax ################################################################

" enable Python highlighting plugin
let g:python_highlight_all = 1


" wimproved ####################################################################

if has('win32')
    " Windows full-screen stuff
    augroup WinFullScreen
        autocmd GUIEnter * silent! WToggleClean
    augroup END
endif


" EasyAlign ####################################################################

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" custom delimiters
let g:easy_align_delimiters = {
  \   '\': { 'pattern': '\\' }
  \ }


" vim-virtualenv ###############################################################

" virtualenv stuff: set the current directory as the base directory where to
" look for a virtualenv. Thus if the virtualenv lies in ".env", enable it with
" :Virtualenv .env
let g:virtualenv_directory = '.'


" Goyo #########################################################################

" Callbacks when entering/leaving goyo
let g:goyo_linenr = 1 "keep line numbering

function! s:goyo_enter()
  set nonumber
endfunction

function! s:goyo_leave()
  set number
endfunction

augroup GoyoGroup
    autocmd!
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END


" ALE ##########################################################################

set omnifunc=ale#completion#OmniFunc


" vim-asterios #################################################################

if has('unix')
    let s:core_sdk = expand('~/workspace/core/out/Debug/sdk')
    let g:ale_psy_psyko_executable = s:core_sdk . '/bin/psyko'
    let g:ale_psy_psyko_kernel_dir = s:core_sdk . '/k2'

    let g:ale_json_vscode_ls = expand('~/.local/lib/node_modules/'
                \ . 'vscode-json-languageserver/bin/vscode-json-languageserver')
    let g:ale_psy_psyko_jsonconf =
        \ [expand('~/.vim/plugged/vim-asterios/tests/psy/flags.psymodule.json')]

elseif has('win32')

    let s:ks_root = expand('F:\Programs\Krono-Safe')
    let g:ale_psy_psyko_executable = s:ks_root . '\psyko-8.10.2\bin\psyko.exe'
    let g:ale_psy_psyko_kernel_dir = s:ks_root . '\ksim-8.10.2'
    let g:ale_psy_psyko_jsonconf =
        \ [expand('~/.vim/plugged/vim-asterios/tests/psy/flags.psymodule.json')]

endif

" WebDevIcons and NERDTree coloring stuff
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {
            \ 'psy': 'Ψ',
            \ 'bgt': '祥',
            \ }
let s:ks_blue = '03658c'
let g:NERDTreeExtensionHighlightColor = {
            \ 'psy': s:ks_blue,
            \ 'bgt': s:ks_blue,
            \ }

