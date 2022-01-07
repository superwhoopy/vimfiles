set encoding=utf-8
scriptencoding utf8

let g:plug_threads = 16

call plug#begin()

Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dstein64/vim-startuptime'
Plug 'editorconfig/editorconfig-vim'
Plug 'garbas/vim-snipmate'
Plug 'hiphish/jinja.vim'
Plug 'honza/vim-snippets'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-syntax-extra'
Plug 'krono-safe/vim-asterios'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lepture/vim-velocity'
Plug 'Lokaltog/vim-easymotion'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'ngg/vim-gn'
Plug 'ntpeters/vim-better-whitespace'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'romainl/flattened' " Solarized without bullshit
Plug 'ryanoasis/vim-devicons'
Plug 'raimon49/requirements.txt.vim'
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
Plug 'vim-scripts/cflow-output-colorful'
Plug 'vim-scripts/confluencewiki.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'w0rp/ale'
Plug 'wfxr/minimap.vim'
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
set switchbuf=uselast      " when opening quickfix item, use the last buffer

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

  set shell=cmd.exe
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

" Insert non-breaking space (do not remove trailing whitespace!)
inoremap <C-S-Space>  

" Open help in a vertical window (do not remove trailing whitespaces!)
nnoremap <C-H> :vertical botright help 
inoremap <C-H> <Esc>:vertical botright help 

" Tag navigation
noremap <C-Tab>   <C-]>
noremap <C-S-Tab> :ptag <C-R><C-W><CR>
" Open tag under cursor in buffer to the left/right/top/bottom
noremap <Leader>th yiw<C-W>h:tag <C-R>"<CR>
noremap <Leader>tl yiw<C-W>l:tag <C-R>"<CR>
noremap <Leader>tj yiw<C-W>j:tag <C-R>"<CR>
noremap <Leader>tk yiw<C-W>k:tag <C-R>"<CR>

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

" Diff mode switch
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
        execute('nnoremap <A-' . l:key . '> :wincmd ' . l:key . '<CR>')
        execute('inoremap <A-' . l:key . '> '
                    \ . '<Esc>:wincmd ' . l:key . '<CR>a')
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


" telescope mappings -----------------------------------------------------------

" Ctrl+P to find files
" nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
" Ctrl+Shift+P to find tags
nnoremap <C-S-p> :lua require('telescope.builtin').tags()<CR>
" Ctrl+Shift+G to grep into directory (Ctrl+G displays file name)
nnoremap <C-S-g> :lua require('telescope.builtin').live_grep()<CR>
" Ctrl + B to browse openned buffers
nnoremap <C-b> :lua require('telescope.builtin').buffers()<CR>

" <Leader>g to grep the word under the cursor
nnoremap <Leader>g :lua require('telescope.builtin').grep_string()<CR>


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

" SnipMate #####################################################################

imap <Tab> <Plug>snipMateNextOrTrigger
smap <Tab> <Plug>snipMateNextOrTrigger
let g:snipMate = { 'snippet_version' : 1 }


" Better Wihtespaces ###########################################################

hi ExtraWhitespace guibg=red ctermbg=red

" Strip trailing whitespaces
nmap <F10>  :StripWhitespace<CR>

" auto-strip trailing whitespaces on save
let g:strip_whitespace_on_save = 0
let g:strip_whitespace_confirm = 0


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
            \ 'sh': ['shellcheck']
            \ }

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

" telescope ####################################################################

lua << EOF
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = 'move_selection_next',
                ["<C-k>"] = 'move_selection_previous',
            },
            n = {
                ["<C-j>"] = 'move_selection_next',
                ["<C-k>"] = 'move_selection_previous',
            },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--glob=!tags"
        }
    },
    pickers = {
        tags = {
            only_sort_tags = true
        }
    },
}
EOF

" nvim-tree ####################################################################

let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_add_trailing = 1

lua << EOF
require'nvim-tree'.setup{
    disable_netrw = false,
    hijack_netrw = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
    },
    filters = {
        custom = { '.git', '__pycache__', '.venv', '*.egg-info' }
    },
    git = {
        ignore = true,
    },
}
EOF

nmap <C-n> :NvimTreeToggle<CR>
highlight NvimTreeFolderIcon guibg=blue

" Startify #####################################################################

let g:startify_change_to_vcs_root = 1

" Load Startify bookmarks from file; create an empty bookmarks file if it does
" not exist
let s:startify_bookmarks_file = expand('<sfile>:p:h') . '/startify.bookmarks'
if !filereadable(s:startify_bookmarks_file)
    call writefile([], s:startify_bookmarks_file)
endif
let g:startify_bookmarks = readfile(expand('<sfile>:p:h') . '/startify.bookmarks')

" LSP servers ##################################################################

" Python
lua require'lspconfig'.pyright.setup{}
" Rust
lua require'lspconfig'.rust_analyzer.setup{}
" Bash (requires to tweak the starting command on windows)
execute('lua require("lspconfig").bashls.setup('
            \ . ( has('win32')
            \     ? '{ cmd = { "bash-language-server.cmd", "start" } }'
            \     : '{}' )
            \ . ')')

" Vimscript
lua require'lspconfig'.vimls.setup{}

" JSON
lua << EOF
    --Enable (broadcasting) snippet capability for completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require'lspconfig'.jsonls.setup {
      capabilities = capabilities,
    }
EOF

" Firenvim #####################################################################

if exists('g:started_by_firenvim')
    set guifont=UbuntuMono\ Nerd\ Font:h14
    set tw=0
    set linebreak
endif

