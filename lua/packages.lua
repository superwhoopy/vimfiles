local P = {}
packages = P

P.plugins = {
    'aklt/plantuml-syntax',
        -- syntax highlighting
    'cespare/vim-toml',
        -- syntax highlighting
    'dhruvasagar/vim-table-mode',
    'dstein64/vim-startuptime',
        -- profiling: run nvim --startuptime
    'editorconfig/editorconfig-vim',
    {'folke/tokyonight.nvim', branch='main'},
        -- colorscheme
    'ggandor/leap.nvim',
        -- easymotion-like (s)
    'hiphish/jinja.vim',
        -- syntax highlighting

    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    'itchyny/vim-cursorword',
        -- underline the word under the cursor
    'jeffkreeftmeijer/vim-numbertoggle',
        -- disable relative line number on disabled buffers
    'jenterkin/vim-autosource',
    'jremmen/vim-ripgrep',
    'junegunn/vim-easy-align',
    'justinmk/vim-syntax-extra',
        -- extraneous enhanced(?) syntax highlighting, for C, flex, bison
    'krono-safe/vim-asterios',
    'lepture/vim-velocity',
        -- syntax highlighting
    'LnL7/vim-nix',
    'Lokaltog/vim-easymotion',
    'MarcWeber/vim-addon-mw-utils',
    'martinda/Jenkinsfile-vim-syntax',
        -- syntax highlighting
    'majutsushi/tagbar',
    'mhinz/vim-startify',
    'morhetz/gruvbox',
        -- colorscheme
    'ngg/vim-gn',
        -- syntax highlighting
    'ntpeters/vim-better-whitespace',
    'neovim/nvim-lspconfig',
    'neovimhaskell/haskell-vim',
    'nvim-lua/plenary.nvim',
    'nvim-lualine/lualine.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-symbols.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-tree/nvim-web-devicons',
    {'nvim-treesitter/nvim-treesitter', build=':TSUpdate'},
    'raimon49/requirements.txt.vim',
        -- syntax highlighting
    'sainnhe/everforest',
        -- colorscheme
    'shortcuts/no-neck-pain.nvim',
    'shime/vim-livedown',
    'tmhedberg/SimpylFold', -- better Python folding
    'tomtom/tlib_vim',
    'tpope/vim-dispatch',
        -- use :Make instead of :make to run in background
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    'vim-latex/vim-latex',
    'vim-python/python-syntax',
    'vim-scripts/DrawIt',
    'Vimjas/vim-python-pep8-indent',
    'w0rp/ale',
    'zchee/vim-flatbuffers',
        -- syntax highlighting

    { url='ssh://git@dev.ks.int:7999/prot/vim-ks.git' },
}

if vim.fn.has('win32') then
  -- no, nothing
else
  table.insert(P, 'direnv/direnv.vim')
end

-- ###########################################################
-- PLUGINS CONFIGURATION
-- ###########################################################

-- LUALINE
local lualine_opts = {
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

return packages
