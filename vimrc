set encoding=utf-8
scriptencoding utf8

let g:ale_completion_enabled = 1

call plug#begin()

Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml'
Plug 'dhruvasagar/vim-table-mode'
Plug 'drmikehenry/vim-fontsize'
Plug 'editorconfig/editorconfig-vim'
Plug 'garbas/vim-snipmate'
Plug 'hiphish/jinja.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jlanzarotta/bufexplorer'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-syntax-extra'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'krono-safe/vim-asterios'
Plug 'Lokaltog/vim-easymotion'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'ngg/vim-gn'
Plug 'ntpeters/vim-better-whitespace'
Plug 'romainl/flattened' " Solarized without bullshit
Plug 'preservim/nerdtree'
Plug 'raimon49/requirements.txt.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'shime/vim-livedown'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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

if has('win32')
  Plug 'kkoenig/wimproved.vim'
else
  Plug 'direnv/direnv.vim'
endif

Plug 'ssh://git@dev.ks.int:7999/prot/vim-ks.git'

call plug#end()

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

" Default copy/paste from system clipboard
set clipboard=unnamed

" Enable French and English spelling languages by default
set spelllang=en_us,fr

" Have a gui-like rendering even in terminal
set termguicolors
colorscheme gruvbox

" Show tabs, trailing and non-breakable spaces
set list
set listchars=tab:>\ ,trail:-,nbsp:·

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

" <C-Space> for ~omnicompletion~ coc.nvim
" Caution: in some terminals, <C-Space> actually maps to <C-@>...
" inoremap <C-Space> <C-X><C-o>
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <C-@>     coc#refresh()

" Insert non-breaking space
inoremap <C-S-Space>  

" Tag navigation
noremap <C-Tab>   <C-]>
noremap <C-S-Tab> :ptag <C-R><C-W><CR>

" Move across visual lines inside wrapped long lines
nnoremap k gk
nnoremap j gj

" map 'jj' to escape insert mode
inoremap jj    <Esc>

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

" Window navigation: map <Alt-[hjkl]> to 'move around' instructions, in normal
" and insertion mode. Also handle the case of terminal emulators that convert
" keystroke <A-l> into l for some reason...
function s:MapMove()
    for l:key in ['h', 'j', 'k', 'l']
        for l:keycomb in ['<A-' . l:key . '>', '' . l:key]
            execute('nnoremap ' . l:keycomb . ' :wincmd ' . l:key . '<CR>')
            execute('inoremap ' . l:keycomb
                  \ . ' <Esc>:wincmd ' . l:key . '<CR>a')
        endfor
    endfor
endfunction
call s:MapMove()

" Quickly edit vimrc
nmap <F8> :e ~/.vim/vimrc<CR>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>

" Align what remains of the line to the right, according to textwidth. Mapped to
" command :AlignRight, and to <A-Right>
function! AlignRightFrom(line, pos, textwidth) abort
    if a:textwidth == 0
        return
    endif
    let l:spaces_to_insert = a:textwidth - len(a:line)
    if l:spaces_to_insert >= 0
        execute 'normal! i' . repeat(' ', l:spaces_to_insert)
    else
        " TODO: see if we can remove spaces under the cursor?
    endif
endfunction

command! AlignRight call AlignRightFrom(getline('.'), getpos('.')[2] - 1,
            \                           &textwidth)

inoremap <A-Right> <Esc>:call AlignRightFrom(getline('.'), getpos('.')[2] - 1,
            \ &textwidth)<CR>i

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


" NERDTree #####################################################################

let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.a$', '\.gcno$', '__pycache__$',
  \ '\.pyc$', '\.egg-info$', '\.pytest_cache$', '\.git$']


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
let g:snipMate = { 'snippet_version' : 1 }


" Better Wihtespaces ###########################################################

hi ExtraWhitespace guibg=red ctermbg=red

" Strip trailing whitespaces
nmap <F10>  :StripWhitespace<CR>

" auto-strip trailing whitespaces on save
let g:strip_whitespace_on_save = 0
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
let g:vimwiki_global_ext = 0
nmap <Leader>ww <Plug>VimwikiIndex:VimwikiGenerateTags<CR>
nmap <Leader>wi <Plug>VimwikiDiaryIndex:VimwikiDiaryGenerateLinks<CR>



" Airline ######################################################################

" airline stuff
let g:airline_theme='gruvbox'
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

" enable ALE status
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1


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


" surround #####################################################################

" use 's' instead of 'S' for surrounding in visual mode (undocumented <Plug>
" stuff: just read the source code)
xmap   s <Plug>VSurround


" ALE ##########################################################################

set omnifunc=ale#completion#OmniFunc
let g:ale_c_parse_compile_commands = 1
let g:ale_c_build_dir_names = ['out/Debug']
let g:ale_linters = { 'cpp' : ['g++'] }

" vim-asterios #################################################################

if has('unix')
    let s:core_sdk = expand('~/workspace/core/out/Debug/sdk')
    let g:ast_psyko_path = s:core_sdk . '/bin/psyko'
    let g:ast_kernel_dir = s:core_sdk . '/k2'

    let g:ale_json_vscode_ls = expand('~/.local/node_modules/'
                \ . 'bin/vscode-json-languageserver')
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
let s:ks_blue = '03658c'
let g:NERDTreeExtensionHighlightColor = {
            \ 'psy': s:ks_blue,
            \ 'bgt': s:ks_blue,
            \ }

