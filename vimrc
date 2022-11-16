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
Plug 'ggandor/leap.nvim'
Plug 'hiphish/jinja.vim'
Plug 'honza/vim-snippets'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jenterkin/vim-autosource'
Plug 'jlanzarotta/bufexplorer'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-syntax-extra'
Plug 'krono-safe/vim-asterios'
Plug 'lepture/vim-velocity'
Plug 'LnL7/vim-nix'
Plug 'Lokaltog/vim-easymotion'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox' " colorscheme
Plug 'ngg/vim-gn'
Plug 'ntpeters/vim-better-whitespace'
Plug 'neovim/nvim-lspconfig'
Plug 'neovimhaskell/haskell-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'} " We recommend updating the parsers on update
Plug 'ryanoasis/vim-devicons'
Plug 'raimon49/requirements.txt.vim'
Plug 'sainnhe/everforest' " Theme
Plug 'sunjon/Shade.nvim'
Plug 'shime/vim-livedown'
Plug 'tmhedberg/SimpylFold' " better Python folding
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-latex/vim-latex'
Plug 'vim-python/python-syntax'
Plug 'vim-scripts/DrawIt'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'w0rp/ale'
Plug 'yamatsum/nvim-cursorline'
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
set clipboard=unnamed,unnamedplus

" Enable French and English spelling languages by default
set spelllang=en_us,fr

" Have a gui-like rendering even in terminal
set termguicolors

" always have a status line for each window
set laststatus=2

" set colorscheme once in this variable, and use it for all plugins that require
" it
let s:colorscheme = 'everforest'
" let s:colorscheme = 'gruvbox'
execute("colorscheme " . s:colorscheme)

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
" SOURCE LOCAL VIMRC FILE COMPLEMENT
"###############################################################################
" this file is not versioned, and is local to the machine
let s:local_vimrc = expand('<sfile>:p:h') . '/localrc.vim'
if filereadable(s:local_vimrc)
    execute("source " . s:local_vimrc)
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
function s:OpenTagInDirection()
    for l:direction in ["h","j","k","l"]
        execute("noremap <Leader>t" . l:direction . " yiw<C-W>"
                    \ . l:direction . ":tag <C-R>\"<CR>")
    endfor
endfunction
call s:OpenTagInDirection()

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

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" telescope mappings -----------------------------------------------------------

" Ctrl+P to find files
nnoremap <C-p> :lua require('telescope.builtin').fd()<CR>
" Ctrl+Shift+P to find tags
nnoremap <C-S-p> :lua require('telescope.builtin').tags()<CR>
" Ctrl+Shift+G to grep into directory (Ctrl+G displays file name)
nnoremap <C-S-g> :lua require('telescope.builtin').live_grep()<CR>
" Ctrl + B to browse openned buffers
nnoremap <C-b> :lua require('telescope.builtin').buffers()<CR>
" Ctrl + N to browse files from CWD
nnoremap <C-n>
        \ :lua require('telescope').extensions.file_browser.file_browser()<CR>
" Ctrl + Shift + N to browse files from the current buffer
nnoremap <C-S-n>
            \ :lua require('telescope').extensions.file_browser.
            \ file_browser({path='%:p:h', select_buffer=true})<CR>


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

" PlantUML #####################################################################
let g:plantuml_executable_script='plantuml -o out/'

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
let g:airline_theme = s:colorscheme
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
            \ 'c' : ['gcc'],
            \ 'sh': ['shellcheck'],
            \ 'haskell': ['hls', 'ghc'],
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

" telescope ####################################################################

lua << EOF
local fb_actions = require('telescope').extensions.file_browser.actions
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
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                    ["<Left>"] = fb_actions.goto_parent_dir
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
            grouped = true,
        },
    },
}
require("telescope").load_extension "file_browser"
EOF

" nvim-tree ####################################################################

" lua << EOF
" require'nvim-tree'.setup{
"     hijack_netrw = true,
"     update_cwd = true,
"     update_focused_file = {
"         enable = true,
"     },
"     filters = {
"         custom = { '.git', '__pycache__', '.venv', '*.egg-info' }
"     },
"     git = {
"         ignore = true,
"     },
"     renderer = {
"         add_trailing = true,
"         highlight_opened_files = 'all',
"     },
"     actions = {
"         open_file = {
"             window_picker = {
"                 enable = false
"             }
"         },
"     },
" }
" EOF
"
" nmap <C-n> :NvimTreeToggle<CR>

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
    \ ['New Mail', 'enew | set ft=mail'],
    \ ['New Markdown', 'enew | Markdown'],
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

" Goyo #########################################################################

let g:goyo_width = 120
let g:goyo_linenr = 1
let g:goyo_height = 100

" Shade ########################################################################

lua << EOF
require('shade').setup{
  overlay_opacity = 70,
  opacity_step = 5,
  keys = {
      brightness_up    = '<C-Up>',
      brightness_down  = '<C-Down>',
      toggle           = '<Leader>s',
  }
}
EOF

" Treesitter ###################################################################

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
      -- "c", "rst", "bash", "json", "hjson",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "all" },

  highlight = {
    -- `false` will disable the whole extension
    enable = false,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "help", "markdown" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF


" LSP servers ##################################################################

" Python
" lua require'lspconfig'.pyright.setup{}
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
        cmd = { "vscode-json-languageserver", "--stdio" },
        capabilities = capabilities,
    }
EOF

" nvim-cursorline ##############################################################

lua << EOF
    require('nvim-cursorline').setup {
        cursorline = {
            enable = true,
            timeout = 500,
            number = false,
        },
        cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
        }
    }
EOF

" leap #########################################################################

lua << EOF
    require('leap').setup {
      max_aot_targets = nil,
      highlight_unlabeled = false,
      max_highlighted_traversal_targets = 10,
      case_sensitive = false,
      -- Sets of characters that should match each other.
      -- Obvious candidates are braces and quotes ('([{', ')]}', '`"\'').
      equivalence_classes = { ' \t\r\n', },
      -- Leaving the appropriate list empty effectively disables "smart" mode,
      -- and forces auto-jump to be on or off.
      special_keys = {
        repeat_search  = '<enter>',
        next_aot_match = '<enter>',
        next_match     = {';', '<enter>'},
        prev_match     = {',', '<tab>'},
        next_group     = '<space>',
        prev_group     = '<tab>',
      },
    }
    require('leap').set_default_keymaps()
EOF

