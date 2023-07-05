set encoding=utf-8
scriptencoding utf8

let g:plug_threads = 16

call plug#begin()

    Plug 'aklt/plantuml-syntax'
        " syntax highlighting
    Plug 'cespare/vim-toml'
        " syntax highlighting
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'dstein64/vim-startuptime'
        " profiling: run nvim --startuptime
    Plug 'editorconfig/editorconfig-vim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
        " colorscheme
    Plug 'ggandor/leap.nvim'
        " easymotion-like (s)
    Plug 'hiphish/jinja.vim'
        " syntax highlighting

    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    " TODO: find a recent snippet engine
    " Plug 'honza/vim-snippets'

    Plug 'itchyny/vim-cursorword'
        " underline the word under the cursor
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
        " disable relative line number on disabled buffers
    Plug 'jenterkin/vim-autosource'
    Plug 'jremmen/vim-ripgrep'
    Plug 'junegunn/vim-easy-align'
    Plug 'justinmk/vim-syntax-extra'
        " extraneous enhanced(?) syntax highlighting, for C, flex, bison
    Plug 'krono-safe/vim-asterios'
    Plug 'lepture/vim-velocity'
        " syntax highlighting
    Plug 'LnL7/vim-nix'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'martinda/Jenkinsfile-vim-syntax'
        " syntax highlighting
    Plug 'majutsushi/tagbar'
    Plug 'mhinz/vim-startify'
    Plug 'morhetz/gruvbox'
        " colorscheme
    Plug 'ngg/vim-gn'
        " syntax highlighting
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'neovim/nvim-lspconfig'
    Plug 'neovimhaskell/haskell-vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-symbols.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-telescope/telescope-live-grep-args.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'}
    Plug 'raimon49/requirements.txt.vim'
        " syntax highlighting
    Plug 'sainnhe/everforest'
        " colorscheme
    Plug 'shortcuts/no-neck-pain.nvim'
    Plug 'shime/vim-livedown'
    Plug 'tmhedberg/SimpylFold' " better Python folding
    Plug 'tomtom/tlib_vim'
    Plug 'tpope/vim-dispatch'
        " use :Make instead of :make to run in background
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'vim-latex/vim-latex'
    Plug 'vim-python/python-syntax'
    Plug 'vim-scripts/DrawIt'
    Plug 'Vimjas/vim-python-pep8-indent'
    Plug 'w0rp/ale'
    Plug 'zchee/vim-flatbuffers'
        " syntax highlighting

    if has('win32')
      " no, nothing
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
for s:direction in ["h","j","k","l"]
    execute("noremap <Leader>t" . s:direction . " yiw<C-W>"
                \ . s:direction . ":tag <C-R>\"<CR>")
endfor

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
for s:key in ['h', 'j', 'k', 'l']
    execute('nnoremap <A-' . s:key . '> :wincmd ' . s:key . '<CR>')
    execute('inoremap <A-' . s:key . '> '
                \ . '<Esc>:wincmd ' . s:key . '<CR>a')
endfor

" Quickly edit vimrc
nmap <F8> :e ~/.vim/vimrc<CR>

" Search for visually selected text
vnoremap // y/<C-R>"<CR>

" Align what remains of the line to the right, according to textwidth. Mapped to
" command :AlignRight, and to <A-Right>
command! AlignRight call utils#AlignRightFrom(getline('.'), getpos('.')[2] - 1,
            \                           &textwidth)
inoremap <A-Right> <Esc>:AlignRight<CR>i

" switch known words (see lua/utils.lua)
nnoremap <Leader>s :lua require('utils').switch_word_under_cursor()<CR>

" clear all buffers but the one active
command! ClearBufs call utils#DeleteAllBuffersButCurrent()

" terminal configuration -------------------------------------------------------

" jj to exit terminal-mode, do not map <Esc> (to use vim mode as one would
" expect)
tnoremap jj <C-\><C-n>

" window navigation
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l

" disable trailing whitespaces highlighting in terminal windows
autocmd TermOpen * DisableWhitespace
" enter insertion mode immediately when opening/focusing the terminal
autocmd BufWinEnter,WinEnter term://* startinsert

if has('win32')
    " shorthand command to spawn a terminal with my zsh shell - need to define a
    " msys2.cmd command somewhere in the PATH that does what's necessary
    command! Terminal execute('terminal msys2')
endif

" telescope mappings -----------------------------------------------------------

" Ctrl+P to find files
nnoremap <C-p> :lua require('telescope.builtin').fd()<CR>
" Ctrl+Shift+P to find tags
nnoremap <C-S-p> :lua require('telescope.builtin').tags()<CR>
" Ctrl+Shift+G to grep into directory (Ctrl+G displays file name)
nnoremap <C-S-g> :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
" Ctrl + B to browse openned buffers
nnoremap <C-b> :lua require('telescope.builtin').buffers({sort_mru=true})<CR>
" Ctrl + N to browse files from CWD
nnoremap <C-n>
            \ :lua require('telescope').extensions.file_browser.
            \ file_browser({respect_gitignore=false,
            \ layout_config={bottom_pane={height=80}}})<CR>
" Ctrl + Shift + N to browse files from the current buffer
nnoremap <C-S-n>
            \ :lua require('telescope').extensions.file_browser.
            \ file_browser({path='%:p:h', select_buffer=true,
            \               respect_gitignore=false,
            \               layout_config={bottom_pane={height=80}}})<CR>


" <Leader>g to grep the word under the cursor
nnoremap <Leader>g :lua require('telescope.builtin').grep_string()<CR>

" <Leader>D to show diagnostics
nnoremap <Leader>D :lua require('telescope.builtin').diagnostics()<CR>



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

" Better Wihtespaces ###########################################################

hi ExtraWhitespace guibg=red ctermbg=red

" Strip trailing whitespaces
nmap <F10>  :StripWhitespace<CR>

" auto-strip trailing whitespaces on save
let g:strip_whitespace_on_save = 0
let g:strip_whitespace_confirm = 0


" Lualine ######################################################################

:lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'searchcount'},
    lualine_b = {'branch',
                 {'diagnostics', sources = {'ale', 'nvim_lsp'}}
                },
    lualine_c = {{'filename',
                  path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
END

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

" telescope ###################################################################

:lua << EOF
local fb_actions = require('telescope').extensions.file_browser.actions
local lga_actions = require('telescope-live-grep-args.actions')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = 'move_selection_next',
                ["<C-k>"] = 'move_selection_previous',
                ["jj"] = { "<esc>", type="command" },
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
            git_status = false,
        },
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            -- define mappings, e.g.
            mappings = { -- extend mappings
            i = { },
            },
        }
    },
}
require("telescope").load_extension "file_browser"
require("telescope").load_extension("live_grep_args")
EOF

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

" Treesitter ###################################################################

:lua << EOF
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

:lua << EOF
  -- nvim-cmp for autocompletion
  local cmp = require('cmp')
  cmp.setup({
      snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
                     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                   end,
      },
      window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- Accept currently selected item. Set `select` to `false` to only
          -- confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'vsnip' }, -- For vsnip users.
          { name = 'buffer',
            option = { get_bufnrs = vim.api.nvim_list_bufs },
          },
      })
  })

  -- Rust LS
  require'lspconfig'.rust_analyzer.setup{}

  -- Vimscript LS
  require'lspconfig'.vimls.setup{}

  -- JSON LS
  --Enable (broadcasting) snippet capability for completion
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  require'lspconfig'.jsonls.setup {
      capabilities = capabilities,
  }

  -- Python LS
  capabilities = require('cmp_nvim_lsp').default_capabilities()
  require'lspconfig'.pylsp.setup{
    settings = {
      pylsp = {
        plugins = {
          autopep8 = { enabled=false },
          pyflakes = { enabled=false },

          yapf = { enabled=true },
          ruff = { enabled=true },
        }
      }
    },
    capabilities = capabilities,
  }

  -- Lua
  require'lspconfig'.lua_ls.setup {
    Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most
          -- likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
    },
  }

  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
EOF

" Bash (requires to tweak the starting command on windows)
execute('lua require("lspconfig").bashls.setup('
            \ . ( has('win32')
            \     ? '{ cmd = { "bash-language-server.cmd", "start" } }'
            \     : '{}' )
            \ . ')')

" pretty signs
sign define DiagnosticSignError text=🔴 texthl=DiagnosticSignError linehl= numhl=
sign define DiagnosticSignWarn text=⚠ texthl=DiagnosticSignWarn linehl= numhl=
sign define DiagnosticSignInfo text=ℹ texthl=DiagnosticSignInfo linehl= numhl=
sign define DiagnosticSignHint text=👉 texthl=DiagnosticSignHint linehl= numhl=


" leap #########################################################################

lua require('leap').set_default_keymaps()

" NoNeckPain ###################################################################

:lua << EOF
require("no-neck-pain").setup({
      mappings = {
          enabled = true,
          toggle = "<Leader>np",
          widthUp = false,
          widthDown = false,
          scratchPad = false,
      },

      buffers = {
          setNames = false,
          -- colors to apply to both side buffers, for buffer scopped options @see |NoNeckPain.bufferOptions|
          --- see |NoNeckPain.bufferOptionsColors|
          colors = {
              background = nil,
              blend = 0.1,
              text = nil,
          },
      },
})
EOF
