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
" Vundle setup

"Vundle bootstrap
if !filereadable($HOME . '/vimfiles/bundle/Vundle.vim/.git/config') && 
      \ confirm("Clone Vundle?","Y\nn") == 1
    exec '!git clone https://github.com/gmarik/Vundle.vim $HOME/vimfiles/bundle/Vundle.vim/'
endif

set nocompatible
filetype off
set rtp+=$HOME/vimfiles/bundle/Vundle.vim
"call vundle#begin('%USERPROFILE%/vimfiles/bundle')
call vundle#begin()

Plugin 'VundleVim/Vundle.Vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/tabular'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'junegunn/goyo.vim'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mileszs/ack.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-latex/vim-latex'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/DrawIt'
Plugin 'vim-scripts/Gundo'
Plugin 'vimwiki/vimwiki'

call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=light

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"    \| exe "normal g'\"" | endif
"endif

set bg=dark

set grepprg=c:/cygwin/bin/grep.exe\ -IRn\ --exclude-dir=\\.git\ --exclude=tags\ --exclude-dir=\\.env\ $*

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
set colorcolumn=81
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
" :set foldlevel=100       " deplier tous les folds jusqu'au nv. 100
set diffopt+=iwhite        " en mode 'diff', ignorer les espaces

" Windows dark magic to make the backspace key work properly...
set backspace=2

" Mappings
" Ouvrir le Buffer explorer avec la touche F12
nnoremap <F12> :BufExplorer<CR>
" Ctrl+Space : suivre un lien dans une fenetre splittee
map <C-Space> :vsp<CR><C-]>
" Ctrl-S : sauvegarder fichier courant, même si on est en mode d'édition
imap <C-s> <Esc>:w<CR>a
nmap <C-s> :w<CR>:echo "File saved."<CR>

imap <C-Q> <Esc>:w<CR>:mak<CR>
nmap <C-Q> :w<CR>:mak<CR>
" Touche F8 : set encoding = UTF8
nmap <F8>  :set encoding=utf8<CR>
" <C-Space> for omnicompletion
inoremap <C-Space> <C-X><C-o>
" Navigation entre fenetres
nnoremap <A-l> :wincmd l<CR>
nnoremap <A-k> :wincmd k<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <A-h> :wincmd h<CR>
"nnoremap <Tab> :exe wincmd

" Tag navigation
nmap     <C-Tab>    <C-]>
nmap     <C-S-Tab>  :ptag  <C-R><C-W><CR>


nnoremap k         gk
nnoremap j         gj

" reformat inner paragraph
nmap <A-q>  vipgq

" Build a Ctags file
command Mktags     !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++,c .

" Export to a PDF file
" command ToPDF      call ExportToPDF()
" function ExportToPDF()
"     ha > %.ps
"     !ps2pdf %.ps
"     !rm -f %.ps
"     echo "Exported to PDF"
" endfunction

" Change to the directory of the current file
command Cd              cd\ %:p:h

" Ack the word under the cursor
nmap    �   "gyiw:execute "Ack " getreg('g')<CR>

" Invoke adequate plugins according to the filetype
filetype on
filetype plugin indent on

" Omnicpp stuff
au BufNewFile,BufRead,BufEnter *.c,*.h,*.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
let OmniCpp_ShowPrototypeInAbbr = 1
set completeopt=menu

" Windows TMP directory handling
set directory+=,~/tmp,$TMP,$TEMP

" visual autocomplete for command menu
set wildmenu

" Leader key is ','
:let mapleader=","
"
" Diffmode switch
nmap <A-d>  :if &diff<CR>diffoff<CR>set nocrb<CR>else<CR>diffthis<CR>endif<CR><CR>

" Height of the preview window (24=twice default size)
set previewheight=24

function ToggleAutoFormat()
    if &fo =~'a'
      set fo-=a
      echom "Auto-Format disabled"
    else
      set fo+=a
      echom "Auto-Format enabled"
    endif
endfunction

nmap <Leader>fo :call ToggleAutoFormat()<CR>

" Line under cursor highlighting
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    autocmd FocusGained * set cul
    autocmd FocusLost   * set nocul
augroup END
"
" Status line configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*%=%f\ %m\ %r\ %{fugitive#statusline()}

"###############################################################################
" Plugins-related stuff
"###############################################################################

" Gundo map
:noremap <F5> :GundoToggle<CR>

" run syntastic check
:noremap  <F6> :SyntasticCheck<CR>
:inoremap <F6> <Esc>:SyntasticCheck<CR>a


" old stuff?
let g:otl_map_tabs = 1
let g:otl_initial_foldlevel = 10
let g:tex_flavor="latex"

" Taglists (:TlistToggle)
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1

" NerdTree
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.a$', '\.gcno$', '__pycache__', '\.pyc$']

" CtrlP
let g:ctrlp_custom_ignore= '\v[\/]\.o$\|\v[\/]\.obj$\|\v[\/]\.pyc$\|\v[\/]\.sbr$'

" SYNTASTIC OPTIONS
" Disable indentation error messages
let g:syntastic_python_pylint_args='--rcfile=~/.pylintrc'
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_compiler='gcc'
let g:syntastic_python_checkers=['pylint']
" Uncomment the following line to disable syntastic check upon saving
" let g:syntastic_mode_map = { "mode": "passive" }

" ExtraWhitespace highlighting
hi ExtraWhitespace guibg=red ctermbg=red
" Strip trailing whitespaces
nmap <F10>  :StripWhitespace<CR>

" tell NerdTree to display all files
" let NERDTreeIgnore=[]

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
  \    'path'                      : 'E:/vimwiki/',
  \    'diary_link_fmt'            : '%Y-%m-%d',
  \    'template_ext'              : '.tpl',
  \    'syntax'                    : 'default',
  \    'custom_wiki2html'          : '',
  \    'automatic_nested_syntaxes' : 1,
  \    'index'                     : 'index',
  \    'diary_header'              : 'Diary',
  \    'ext'                       : '.wiki',
  \    'path_html'                 : 'C:/Users/eohayon/vimwiki_html/',
  \    'temp'                      : 0,
  \    'template_path'             : 'C:/Users/eohayon/vimwiki/templates/',
  \    'list_margin'               : -1,
  \    'diary_rel_path'            : 'diary/'
  \    }]
nmap <Leader>ww <Plug>VimwikiIndex:VimwikiGenerateTags<CR>
nmap <Leader>wi <Plug>VimwikiDiaryIndex:VimwikiDiaryGenerateLinks<CR>

" goyo stuff
let g:goyo_linenr = 1 "keep line numbering

