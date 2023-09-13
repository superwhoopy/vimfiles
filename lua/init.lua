-- #############################################################################
-- MAPPINGS
-- #############################################################################

vim.keymap.set({ 'i', 'n' }, '<C-s>', '<Cmd>w<CR>',
               { desc = "Save current file" })

-- (do not remove trailing whitespaces!)
vim.keymap.set({ 'n' }, '<C-h>', ':vertical botright help ',
               { desc = "Open help in a vertical window" })

vim.keymap.set('n', '<C-Tab>', '<C-]>',
               { desc = "Goto Tag Definition" })
-- do not use <Cmd> or else <C-R><C-W> won't work
vim.keymap.set('n', '<C-S-Tab>', ':ptag <C-r><C-w><CR>',
               { desc = "Open Tag in preview window" })

for direction, key in pairs({ left = 'h', right = 'l', down = 'j', up = 'k' }) do
  vim.keymap.set('n', '<Leader>t' .. key,
                 'yiw<C-W>' .. key .. ':tag <C-R>"<CR>',
                 { desc = "Open tag in window " .. direction })
end

vim.keymap.set('n', '<Leader>s',
               '<Cmd>lua require("utils").switch_word_under_cursor()<CR>',
               { nowait = true,
                 desc = 'Switch "boolean" word under cursor', })

vim.keymap.set('i', '<C-f>', '<Cmd>call utils#FillLine()<CR>',
   { desc = 'Fill the remaining of the line with a repeated string' })

vim.keymap.set({ 'i', 'n' }, '<Leader>d', '<Cmd>Gvdiff<CR>',
  { desc = 'Run git diff on the current file (Gvdiffsplit)' })

vim.keymap.set({ 'i', 'n' }, '<A-d>', '<Cmd>call utils#DiffSwitch()<CR>',
  { desc = 'Switch diff mode on and off for the current buffer' })

vim.keymap.set('i', '<S-Tab>', '<Cmd>lua require("utils").ShiftTab()<CR>',
  { desc = 'Insert spaces to align with the line above' })

-- TERMINAL MAPPINGS ###########################################################

-- <C-j><C-j> to exit terminal-mode, do not map <Esc> (to use vim mode as one
-- would expect), and do not map jj either, because its painful when scrolling a
-- pager
vim.keymap.set('t', '<C-j><C-j>', '<C-\\><C-n>',
  { desc = 'Exit Terminal mode' } )

vim.keymap.set('t', '<A-h>', '<C-\\><C-N><C-w>h',
  { desc = 'Unfocus from terminal and move to window to the left' })
vim.keymap.set('t', '<A-j>', '<C-\\><C-N><C-w>j',
  { desc = 'Unfocus from terminal and move to window below' })
vim.keymap.set('t', '<A-k>', '<C-\\><C-N><C-w>k',
  { desc = 'Unfocus from terminal and move to window above' })
vim.keymap.set('t', '<A-l>', '<C-\\><C-N><C-w>l',
  { desc = 'Unfocus from terminal and move to window to the right' })


-- LSP SERVERS #################################################################
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float,
               {desc="Open float with diagnostic"})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
               {desc="Goto previous diag. message"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
               {desc="Goto next diag. message"})
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist,
               {desc="Create a loclist with diag. messages"})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = function(desc)
      return { buffer = ev.buf, desc=desc }
    end
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
                   opts("LSP: GoTo Declaration"))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
                   opts("LSP: GoTo Definition"))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover,
                   opts("LSP: Hover"))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
                   opts("LSP: GoTo Implementation"))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
                   opts("LSP: Signature Help"))
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder,
                   opts("LSP: Add Folder to Workspace"))
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
                   opts("LSP: Remove Folder from Workspace"))
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts("LSP: List Folders in Workspace"))
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition,
                   opts("LSP: Type Definition"))
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename,
                   opts("LSP: Rename"))
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action,
                   opts("LSP: Code Action"))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references,
                   opts("LSP: References"))
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts("LSP: Format"))
  end,
})

