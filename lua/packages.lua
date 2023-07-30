local P = {}
packages = P

-- #############################################################################
-- PLUGINS CONFIGURATION
-- #############################################################################

-- LUALINE ---------------------------------------------------------------------

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

-- TELESCOPE -------------------------------------------------------------------

local function telescope_fn()
  local fb_actions = require('telescope').extensions.file_browser.actions
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
end


-- TREESITTER ------------------------------------------------------------------

local function nvim_treesitter_fn()
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

      -- NOTE: these are the names of the parsers and not the filetype. (for
      -- example if you want to disable highlighting for the `tex` filetype, you
      -- need to include `latex` in this list as this is the name of the parser)
      -- list of language that will be disabled
      disable = { "help", "markdown" },

      -- Setting this to true will run `:h syntax` and tree-sitter at the same
      -- time. Set this to `true` if you depend on 'syntax' being enabled (like
      -- for indentation). Using this option may slow down your editor, and you
      -- may see some duplicate highlights. Instead of true it can also be a
      -- list of languages
      additional_vim_regex_highlighting = false,
    },
  }
end


-- NO NECK PAIN ----------------------------------------------------------------
local noneckpain_opts = {
  mappings = {
    enabled = true,
    toggle = "<Leader>np",
    widthUp = false,
    widthDown = false,
    scratchPad = false,
  },

  buffers = {
    setNames = false,
    -- colors to apply to both side buffers, for buffer scopped options @see
    -- |NoNeckPain.bufferOptions|
    --- see |NoNeckPain.bufferOptionsColors|
    colors = {
      background = nil,
      blend = 0.1,
      text = nil,
    },
  },
}

-- LSP SERVERS -----------------------------------------------------------------

-- nvim-cmp (autocompletion)
local function nvim_cmp_fn()
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
end

-- lspconfig for various languages
local function lspconfig_fn()
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

  -- Bash
  local _bash_opts = {}
  if vim.fn.has('win32') then
    _bash_opts = { cmd = { "bash-language-server.cmd", "start" } }
  end
  require('lspconfig').bashls.setup(_bash_opts)
end

-- #############################################################################
-- PLUGINS LISTING
-- #############################################################################

P.plugins = {
  'aklt/plantuml-syntax',
  'cespare/vim-toml',
  'dhruvasagar/vim-table-mode',

  'dstein64/vim-startuptime', -- profiling: run nvim --startuptime

  'editorconfig/editorconfig-vim',

  {'folke/tokyonight.nvim', branch='main'}, -- colorscheme

  {
    'ggandor/leap.nvim',
    init=function()
      require('leap').set_default_keymaps()
    end
  }, -- easymotion-like (s)

  'hiphish/jinja.vim',

  {'hrsh7th/nvim-cmp', config=nvim_cmp_fn},
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',

  'itchyny/vim-cursorword', -- underline the word under the cursor
  'jeffkreeftmeijer/vim-numbertoggle', -- disable relative line number on
                                       -- disabled buffers
  'jenterkin/vim-autosource',
  'jremmen/vim-ripgrep',
  'junegunn/vim-easy-align',
  'justinmk/vim-syntax-extra', -- extraneous enhanced(?) syntax highlighting,
                               -- for C, flex, bison
  'krono-safe/vim-asterios',
  'lepture/vim-velocity',
  'LnL7/vim-nix', -- syntax highlighting
  'Lokaltog/vim-easymotion',
  'MarcWeber/vim-addon-mw-utils',
  'martinda/Jenkinsfile-vim-syntax', -- syntax highlighting
  'majutsushi/tagbar',
  'mhinz/vim-startify',
  'morhetz/gruvbox', -- colorscheme
  'ngg/vim-gn', -- syntax highlighting
  'ntpeters/vim-better-whitespace',
  {'neovim/nvim-lspconfig', config=lspconfig_fn},
  'neovimhaskell/haskell-vim',
  'nvim-lua/plenary.nvim',

  {'nvim-lualine/lualine.nvim', opts=lualine_opts},

  {'nvim-telescope/telescope.nvim', config=telescope_fn},
  'nvim-telescope/telescope-symbols.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-live-grep-args.nvim',
  'nvim-tree/nvim-web-devicons',

  {'nvim-treesitter/nvim-treesitter',
  build=':TSUpdate',
  config=nvim_treesitter_fn},

  'raimon49/requirements.txt.vim', -- syntax highlighting
  'sainnhe/everforest', -- colorscheme

  {'shortcuts/no-neck-pain.nvim', opts=noneckpain_opts},
  'shime/vim-livedown',
  'tmhedberg/SimpylFold', -- better Python folding
  'tomtom/tlib_vim',
  'tpope/vim-dispatch', -- use :Make instead of :make to run in background
  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'vim-latex/vim-latex',
  'vim-python/python-syntax',
  'vim-scripts/DrawIt',
  'Vimjas/vim-python-pep8-indent',
  'w0rp/ale',
  'zchee/vim-flatbuffers', -- syntax highlighting

  { url='ssh://git@dev.ks.int:7999/prot/vim-ks.git' },
}

if vim.fn.has('win32') then
  -- no, nothing
else
  table.insert(P, 'direnv/direnv.vim')
end


return packages
