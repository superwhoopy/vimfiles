" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
" runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=$HOME/vimfiles/bundle/Vundle.vim

call plug#begin()

Plug 'davidhalter/jedi-vim'
Plug 'garbas/vim-snipmate'
Plug 'hiphish/jinja.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-syntax-extra'
Plug 'kien/ctrlp.vim'
Plug 'kkoenig/wimproved.vim'
Plug 'krono-safe/vim-asterios'
Plug 'Lokaltog/vim-easymotion'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'romainl/flattened' " Solarized without bullshit
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
Plug 'vim-scripts/Gundo'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'

call plug#end()
filetype plugin indent on
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on
set bg=dark

set grepprg=/bin/grep\ -Irn\ --exclude-dir=\\.git\ --exclude=tags\ $*
" Vim options
set hlsearch               " highlight search result
set ic                     " ignore case
set incsearch              " incremental search
set number                 " print line numbers
set shiftwidth=2           " TAB equals 2 spaces
set tabstop=2              " ...probably the same thing
set expandtab              " use spaces, not tabs
set autoindent             " auto-indentation
set tw=80                  " default text width: 80 chars
set colorcolumn=81         " light up the 80-th column
hi ColorColumn ctermbg=lightgrey guibg=lightgrey
set wrap                   " Wrap if the line extends...
set shm=A                  " do not prompt warning message if the file is
                           " already opened
set autoread               " re-read the file if it is modified externally
" set foldcolumn=1           " colonne de gauche pour indiquer les zones
                           " \"foldables\"
set scrolloff=3            " toujours afficher au moins 3 lignes au dessus et
                           " en dessous du curseur
set modeline               " autoriser les modlines
set foldmethod=indent      " Folding base sur l'indentation
set foldlevelstart=100    " deplier tous les folds jusqu'au nv. 100
set diffopt+=iwhite        " en mode 'diff', ignorer les espaces
set encoding=utf-8
set nojoinspaces           " don't add extra whitespace when formatting

" Windows dark magic to make the backspace key work properly...
set backspace=2
set noshellslash

if !has('nvim')
  " Python DLL to look for on Windows
  set pythonthreedll=python36.dll
endif

" Mappings
" Ouvrir le Buffer explorer avec la touche F12
nnoremap <F12> :BufExplorer<CR>

" Ctrl-S : sauvegarder fichier courant, meme en mode edition
imap <C-s> <Esc>:w<CR>a
nmap <C-s> :w<CR>:echo "File saved."<CR>

" <C-Space> for omnicompletion
inoremap <C-Space> <C-X><C-o>

"nnoremap <Tab> :exe wincmd

" Tag navigation
nmap     <C-Tab>    <C-]>
nmap     <C-S-Tab>  :ptag  <C-R><C-W><CR>

" Move across visual lines inside wrapped long lines
nnoremap k         gk
nnoremap j         gj

" reformat inner paragraph
nmap <A-q>  vipgq

" Build a Ctags file
command! MkTags call MkTags()
function! MkTags()
  let scripts = [ './build/mktags.sh', 'env/mktags.sh' ]
  for scriptfile in scripts
    if filereadable(scriptfile)
      let message = "Running file " . scriptfile
      echo message
      execute 'silent !bash ' . scriptfile
      silent !clear
      return
    endif
  endfor
  echo "No tags building script file, running default"
  exec '!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++,c .'
endfunction

" Export to a PDF file
" command ToPDF      call ExportToPDF()
" function ExportToPDF()
"     ha > %.ps
"     !ps2pdf %.ps
"     !rm -f %.ps
"     echo "Exported to PDF"
" endfunction

" Change to the directory of the current file
command! Cd              cd\ %:p:h

" Diffmode switch
nmap <A-d>  :if &diff<CR>diffoff<CR>set nocrb<CR>else<CR>diffthis<CR>endif<CR><CR>

" Invoke adequate plugins according to the filetype
filetype off
filetype plugin indent on

" Omnicpp stuff
" au BufNewFile,BufRead,BufEnter *.c,*.h,*.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
" let OmniCpp_ShowPrototypeInAbbr = 1
" set completeopt=menu

" visual autocomplete for command menu
set wildmenu
set wildignore=*/.git/*,*.o,*.obj,*.lib,*.a,*.pyc,*/__pycache__/*

" Leader key is ','
:let mapleader=","

" Ack the word under the cursor, prompting a path
nmap    <Leader>/   "gyiw:Ack <C-R>g

" Run git diff on the current file
nmap <Leader>d :Gvdiff<CR>

" Height of the preview window (24=twice default size)
set previewheight=24

" Toggle auto-format option with <Leader>fo
function! ToggleAutoFormat()
    if &fo =~'a'
      set fo-=a
      echom "Auto-Format disabled"
    else
      set fo+=a
      echom "Auto-Format enabled"
    endif
endfunction
nmap <Leader>fo :call ToggleAutoFormat()<CR>

" Spell-checking, French / English
function! Spfr()
  set spell
  set spelllang=fr
endfunction
function! Spen()
  set spell
  set spelllang=en
endfunction

function! Date()
  put =strftime(\"%Y-%m-%d (%a)\")
endfunction

"
" Navigation entre fenetres
nnoremap <A-l> :wincmd l<CR>
nnoremap <A-k> :wincmd k<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <A-h> :wincmd h<CR>

" Line under cursor highlighting
" augroup BgHighlight
"     autocmd!
"     autocmd WinEnter * set cul
"     autocmd WinLeave * set nocul
"     autocmd FocusGained * set cul
"     autocmd FocusLost   * set nocul
" augroup END

" Status line configuration
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*%=%f\ %m\ %r\ %{fugitive#statusline()}

" Default copy/paste from system clipboard
set clipboard=unnamed

" Quickly edit vimrc
nmap <F8> :e ~/.vim/vimrc<CR>


"###############################################################################
" Plugins-related stuff
"###############################################################################

" Gundo
:noremap <F5> :GundoToggle<CR>
if has('python3')
  let g:gundo_prefer_python3 = 1
endif

" Taglists (:TlistToggle)
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1

" NerdTree
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.a$', '\.gcno$', '__pycache__',
  \ '\.pyc$', '\.egg-info$']

" DOXYGENTOOLKIT
let g:DoxygenToolkit_briefTag_pre         = ""
let g:DoxygenToolkit_templateParamTag_pre = "\\tparam "
let g:DoxygenToolkit_paramTag_pre         = "\\param "
let g:DoxygenToolkit_returnTag            = "\\return "
let g:DoxygenToolkit_throwTag_pre         = "\\throw "
let g:DoxygenToolkit_fileTag              = "\\file "
let g:DoxygenToolkit_authorTag            = "\\author "
let g:DoxygenToolkit_dateTag              = "\\date "
let g:DoxygenToolkit_versionTag           = "\\version "
let g:DoxygenToolkit_blockTag             = "\\name "
let g:DoxygenToolkit_classTag             = "\\class "
let g:DoxygenToolkit_startCommentTag      = "/*! "
let g:DoxygenToolkit_startCommentBlock    = "/* "
let g:DoxygenToolkit_compactDoc           = "yes"

" CtrlP
let g:ctrlp_custom_ignore= '\v[\/]\.o$\|\v[\/]\.obj$\|\v[\/]\.pyc$\|\v[\/]\.sbr$'

" SYNTASTIC OPTIONS
" python checker rc file
let g:syntastic_python_pylint_args='--rcfile=~/.pylintrc'
" enable C header checking
let g:syntastic_cpp_check_header=1
" default c++ compiler
let g:syntastic_cpp_compiler='gcc'
let g:syntastic_python_python_exe = 'python3'
let g:syntastic_python_pylint_exe = 'pylint3'
" update the errors window upon saving
let g:syntastic_always_populate_loc_list=1
" default python checker
let g:syntastic_python_checkers=['pylint']
" Uncomment the following line to disable syntastic check upon saving
" let g:syntastic_mode_map = { "mode": "passive" }
let g:syntastic_rst_checkers=[]
" Error message displayed in the status line
let syntastic_stl_format="%W{Wrn: }%w%E{| Err: }%e"

" YOUCOMPLETEME STUFF
" disable auto-completion, need to hit <C-Space> to enable it
" let g:ycm_auto_trigger = 0
" enable documentation preview
let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" stop asking confirmation before loading conf. script
let g:ycm_confirm_extra_conf = 0
" disable diagnostics display: I prefer to use syntastic instead
let g:ycm_show_diagnostics_ui = 0
" disale youcompleteme for these file types
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'tex' : 1,
      \ 'mail' : 1,
      \ 'python' : 1
      \}

" SNIPMATE STUFF
imap <C-Tab> <Plug>snipMateNextOrTrigger
smap <C-Tab> <Plug>snipMateNextOrTrigger

" ExtraWhitespace highlighting
hi ExtraWhitespace guibg=red ctermbg=red
" Strip trailing whitespaces
nmap <F10>  :StripWhitespace<CR>
" auto-strip trailing whitespaces on save
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

" Tabularize plugin shortcuts
vmap <Leader>= :Tabularize /=<CR>
vmap <Leader>\ :Tabularize /\<CR>
vmap <Leader>, :Tabularize /,<CR>
vmap <Leader>; :Tabularize /;<CR>
vmap <Leader>: :Tabularize /:<CR>

" Surround plugin shortcuts: use 's' (lower-case) rather than 'S' in visual mode
vmap s <Plug>VSurround

" Search for visually selected text
vnoremap // y/<C-R>"<CR>

" vimwiki stuff
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

" goyo stuff
let g:goyo_linenr = 1 "keep line numbering

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

" enable Python highlighting plugin
let g:python_highlight_all = 1

" Windows full-screen stuff
autocmd GUIEnter * silent! WToggleClean

" EasyAlign stuff
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
  \   '\': { 'pattern': '\\' }
  \ }

" Disable an autopair mapping that fucks up french characters
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutJump = ''

" virtualenv stuff: set the current directory as the base directory where to
" look for a virtualenv. Thus if the virtualenv lies in ".env", enable it with
" :Virtualenv .env
let g:virtualenv_directory = '.'

" Callbacks when entering/leaving goyo
function! s:goyo_enter()
  set nonumber
endfunction

function! s:goyo_leave()
  set number
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ALE stuff
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

