local P = {}

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
      },
      winblend = 30
    },
    pickers = {
      tags = {
        only_sort_tags = true
      }
    },
    extensions = {
      live_grep_args = {
        auto_quoting = true, -- enable/disable auto-quoting
        -- define mappings, e.g.
        mappings = { -- extend mappings
        i = { },
      },
      project = {
        -- TODO: for some reason, this doesn't work
        -- on_project_selected = function(prompt_bufnr)
        --   local project_actions = require('telescope').extensions.project.actions
        --   local proj_dir = project_actions.get_selected_path(prompt_bufnr)
        --   require('utils').run_exrc(proj_dir)
        --   project_actions.change_working_directory(prompt_bufnr)
        -- end
      }
    },
  },
}
  require("telescope").load_extension("live_grep_args")
  require("telescope").load_extension("project")
end


-- TREESITTER ------------------------------------------------------------------

local function nvim_treesitter_fn()
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
      "c", "rst", "bash", "json", "hjson", "lua", "tlaplus", "vimdoc"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "all" },

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- NOTE: these are the names of the parsers and not the filetype. (for
      -- example if you want to disable highlighting for the `tex` filetype, you
      -- need to include `latex` in this list as this is the name of the parser)
      -- list of language that will be disabled
      disable = { "markdown", "vimdoc" },

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
  autocmds = {
    enableOnVimEnter = false,
  },
  mappings = {
    enabled = false,
    -- toggle = "<Leader>np",
    -- widthUp = false,
    -- widthDown = false,
    -- scratchPad = false,
  },

  buffers = {
    setNames = false,

    -- colors to apply to both side buffers, for buffer scopped options @see |NoNeckPain.bufferOptions|
    --- see |NoNeckPain.bufferOptionsColors|
    colors = {
      -- Hexadecimal color code to override the current background color of the buffer. (e.g. #24273A)
      -- Transparent backgrounds are supported by default.
      --- @type string?
      background = "tokyonight-storm",
    },
  },
}

-- INDENT-BLANKLINE ------------------------------------------------------------
local function indent_blankline_fn ()
  require('ibl').setup({
    exclude = {
      -- filetypes = { "inserthere" }
    }
  })
end

-- GITSIGNS --------------------------------------------------------------------
local gitsigns_opts = {
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
}

-- VIM-CURSORWORD --------------------------------------------------------------
local function vim_cursorword_fn()
  -- disable default highlighting
  -- vim.g.cursorword_highlight = 0
  -- define highlighting group
  vim.api.nvim_cmd({
    cmd = "highlight",
    args = { 'CursorWord', 'guisp=Gray', 'cterm=underline', 'gui=underline' },
  }, {})
end


-- ALPHA-NVIM ------------------------------------------------------------------

local function alphanvim_fn()
  local dashboard = require('alpha.themes.dashboard')
  local theta = require('alpha.themes.theta')

  theta.header.val = {
    [[                            ,((.                       ]],
    [[                     ((((((((((((((((((                ]],
    [[                 #((#####(,.......#(((((((             ]],
    [[               ######*****,,,,,........(((((/          ]],
    [[              ((###********,,,,,,,.......(((((         ]],
    [[             ((((**********,,,,,,,,,......%%%%%        ]],
    [[            (((((***********,. ,,,,,,......%%%%%       ]],
    [[                     &&&&&&&&&&&. ,,,......*%###       ]],
    [[...(&&&&&&&&&&&&&&&&&&&&&&&&&&&& ,,,,,.....#####       ]],
    [[             %&&&##*****, &&&&  ,,,,,......####.       ]],
    [[             %%%%&##**** &&&& ,,,,,,.....(#(((.        ]],
    [[               #%%&&##* &&&  *,,,,...../#((((.         ]],
    [[                 #%%%% &&& **,,.....##((//(.           ]],
    [[                   .#.&&. ###%####((((((,              ]],
    [[                    .%&.,###(((((((,                   ]],
    [[                    ...,                               ]],
  }
  theta.header.opts.hl = "Title"

  local section_mru = theta.config.layout[4]
  section_mru.val[1].opts.hl = "Constant"

  local function mybutton(sc, txt, keybind, keybind_opts)
    local ans = dashboard.button(sc, txt, keybind, keybind_opts)
    ans.opts.hl = "Question"
    ans.opts.width = 30
    return ans
  end

  theta.buttons.val = {
    { type = "text", val = "Quick links",
      opts = { hl = "Constant", position = "center" } },
    { type = "padding", val = 1 },
    mybutton("e", "  New file", "<cmd>ene<CR>"),
    mybutton("m", "📧 New Mail",
        '<cmd>execute("edit " .. tempname() .. ".txt") | setlocal ft=mail<CR>'),
    mybutton("d", "📚 New Markdown",
        '<cmd>execute("edit " .. tempname() .. ".md")<CR>'),
    mybutton("P", "🗃 Select Project",
        '<cmd>Telescope project<CR>'),
    mybutton("c", "🧹 Clear all buffers",
        '<cmd>call utils#DeleteAllBuffersButCurrent() | AlphaRedraw<CR>'),
    mybutton("q", "❌ Quit", "<cmd>qa!<CR>"),
  }

  local conffiles_buttons = {
    type = "group",
    val = {
      { type = "text", val = "Conf. files",
        opts = { hl = "Constant", position = "center" } },
      { type = "padding", val = 1 },
      mybutton("p", "📦 Neovim: Packages",
        '<cmd>edit ~/.vim/lua/packages.lua<CR>'),
      mybutton("i", "⚙  Neovim: init.vim", '<cmd>edit ~/.vim/init.vim<CR>'),
      mybutton("l", "⚙  Neovim: init.lua", '<cmd>edit ~/.vim/lua/init.lua<CR>'),
      mybutton("g", "🔵 GlazeWM", '<cmd>edit ~/.glaze-wm/config.yaml<CR>'),
      mybutton("a", "⌨  AutoHotKey",
        '<cmd>edit ~/.config/config/ahk/default.ahk<CR>'),
    },
    position = "center",
  }


  local _stats = require('lazy').stats()
  local lazystats = {
    type = "text",
    val = {
      _stats.count .. ' plugins installed'
    },
    opts = { position="center", hl = "@keyword" }
  }
  local date = {
    type = "text",
    val = {
      vim.fn.strftime('%a %d %b %Y')
    },
    opts = { position="center", hl = "@keyword" }
  }

  local footer = {
    type = "text",
    val = {
      [[      _____ __ __   __  __  ]],
      [[  /\ (_  | |_ |__)|/  \(_   ]],
      [[ /--\__) | |__| \ |\__/__)  ]],
      [[___                         ]],
      [[ | _ _|_  _  _ | _  _ . _ _ ]],
      [[ |(-(_| )| )(_)|(_)(_)|(-_) ]],
      [[                   _/       ]],
    },
    opts = {
      position = "center",
      hl = "Type",
    },
  }

  theta.config.layout = {
    { type = "padding", val = 2 },
    theta.header,
    -- footer,
    { type = "padding", val = 2 },
    section_mru,
    { type = "padding", val = 2 },
    theta.buttons,
    { type = "padding", val = 2 },
    conffiles_buttons,
    { type = "padding", val = 2 },
    date,
    lazystats,
  }

  require('alpha').setup(theta.config)
end

-- NEO-TREE --------------------------------------------------------------------

local neotree_opts = {
  close_if_last_window = true,
  source_selector = {
    winbar = true
  },
  buffers = { follow_current_file = { enabled = true } }
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
      }),
      completion = {
        autocomplete = false
      }
  })
end

-- markdown preview
local function markdown_preview_fn()
  -- nothing for now
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

  -- CSS LS
  require'lspconfig'.cssls.setup {
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
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most
          -- likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim',},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    }
  }

  -- Bash
  local _bash_opts = {}
  if vim.fn.has('win32') then
    _bash_opts = { cmd = { "bash-language-server.cmd", "start" } }
  end
  require('lspconfig').bashls.setup(_bash_opts)

  -- typescript / javascript
  require'lspconfig'.tsserver.setup{}
end

-- #############################################################################
-- PLUGINS LISTING
-- #############################################################################

P.plugins = {
  'aklt/plantuml-syntax',
  'azabiong/vim-highlighter',
  'cespare/vim-toml',
  'dhruvasagar/vim-table-mode',

  'dstein64/vim-startuptime', -- profiling: run nvim --startuptime

  'editorconfig/editorconfig-vim',

  {'folke/tokyonight.nvim', branch='main'}, -- colorscheme

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {
    'ggandor/leap.nvim',
    init=function()
      require('leap').set_default_keymaps()
    end
  }, -- easymotion-like (s)

  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = alphanvim_fn,
  },

  'hiphish/jinja.vim',

  {'hrsh7th/nvim-cmp', config=nvim_cmp_fn},
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-vsnip',
  { 'hrsh7th/vim-vsnip' },
  {
    'iamcco/markdown-preview.nvim',
    build = ':call mkdp#util#install()',
    config = markdown_preview_fn
  },
  {
    'itchyny/vim-cursorword', -- underline the word under the cursor
    init = vim_cursorword_fn,
  },
  'jeffkreeftmeijer/vim-numbertoggle', -- disable relative line number on
                                       -- disabled buffers
  'jenterkin/vim-autosource',
  'jremmen/vim-ripgrep',
  'junegunn/vim-easy-align',
  'justinmk/vim-syntax-extra', -- extraneous enhanced(?) syntax highlighting,
                               -- for C, flex, bison
  'krono-safe/vim-asterios',
  'lepture/vim-velocity',
  { 'lewis6991/gitsigns.nvim', opts = gitsigns_opts },
  'LnL7/vim-nix', -- syntax highlighting
  'Lokaltog/vim-easymotion',
  { 'lukas-reineke/indent-blankline.nvim', config = indent_blankline_fn },
  'MarcWeber/vim-addon-mw-utils',
  'martinda/Jenkinsfile-vim-syntax', -- syntax highlighting
  'majutsushi/tagbar',
  'morhetz/gruvbox', -- colorscheme
  'ngg/vim-gn', -- syntax highlighting
  'NoahTheDuke/vim-just',
  'ntpeters/vim-better-whitespace',
  {'neovim/nvim-lspconfig', config=lspconfig_fn},
  'neovimhaskell/haskell-vim',
  'nvim-lua/plenary.nvim',

  {'nvim-lualine/lualine.nvim', opts=lualine_opts},

  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim"
    },
    opts = neotree_opts
  },

  -- Visual search and replace
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {'nvim-telescope/telescope.nvim', config=telescope_fn},
  'nvim-telescope/telescope-symbols.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-live-grep-args.nvim',
  'nvim-telescope/telescope-project.nvim',
  'nvim-tree/nvim-web-devicons',

  {
    'nvim-treesitter/nvim-treesitter',
    build=':TSUpdate',
    config=nvim_treesitter_fn
  },

  'psliwka/vim-smoothie', -- smooth scrolling
  "rafamadriz/friendly-snippets", -- snippets
  'raimon49/requirements.txt.vim', -- syntax highlighting
  'sainnhe/everforest', -- colorscheme

  'sindrets/diffview.nvim',

  {'shortcuts/no-neck-pain.nvim', opts=noneckpain_opts},
  'tmhedberg/SimpylFold', -- better Python folding
  'tomtom/tlib_vim',
  'tpope/vim-dispatch', -- use :Make instead of :make to run in background
  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'vim-latex/vim-latex',
  'vim-python/python-syntax',
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


return P
