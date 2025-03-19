-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { silent = true, noremap = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clear highlights
vim.keymap.set('n', '<ESC>', ':nohl<CR>', opts)

-- Save file
vim.keymap.set('n', '<C-s>', ': w <CR>', opts)

-- Save file without auto-formatting
opts.desc = 'Save file without auto-formatting'
vim.keymap.set('n', '<leader>sn', ':noautocmd w <CR>', opts)

-- Quit file
vim.keymap.set('n', '<C-q>', ': q <CR>', opts)

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Resize with arrows
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)

opts.desc = 'Close buffer'
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', opts)

opts.desc = 'New buffer'
vim.keymap.set('n', '<leader>b', ': enew <CR>', opts)

-- Increment/decrement numbers
opts.desc = 'Increase number'
vim.keymap.set('n', '<leader>+', '<C-a>', opts)

opts.desc = 'Decrease number'
vim.keymap.set('n', '<leader>-', '<C-x>', opts)

-- Window management
opts.desc = 'Split window vertically'
vim.keymap.set('n', '<leader>sv', '<C-w>v', opts)

opts.desc = 'Split window horizontally'
vim.keymap.set('n', '<leader>sh', '<C-w>s', opts)

opts.desc = 'Make split windows equal size'
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)

opts.desc = 'Close current split window'
vim.keymap.set('n', '<leader>sx', ':close<CR>', opts)

-- Tabs
opts.desc = 'Open new tab'
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)

opts.desc = 'Close current tab'
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)

opts.desc = 'Go to next tab'
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)

opts.desc = 'Go to previous tab'
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)

-- Toggle line wrapping
opts.desc = 'Toggle line wrapping'
vim.keymap.set('n', '<leader>lw', ': set wrap!<CR>', opts)

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('i', 'kj', '<ESC>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
-- opts.desc = "Move up"
-- vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
-- vim.keymap.set("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)
-- vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
--
-- opts.desc = "Move down"
-- vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
-- vim.keymap.set("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
-- vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Replace word under cursor
opts.desc = 'Replace word under cursor'
vim.keymap.set('n', '<leader>j', '*``cgn', opts)

-- Explicitly yank to system clipboard (highlighted and entire row)
opts.desc = 'Yank to system clipboard'
vim.keymap.set('n', '<leader>Y', [["+Y]], opts)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], opts)

-- -- Toggle diagnostics
-- local diagnostics_active = true
-- function ToggleDiagnostics()
--   diagnostics_active = not diagnostics_active
--
--   if diagnostics_active then
--     vim.diagnostic.enable(true)
--   else
--     vim.diagnostic.enable(false)
--   end
-- end
--
-- vim.keymap.set('n', '<leader>do', ToggleDiagnostics, { desc = 'Toggle diagnostics' })
--
-- -- Diagnostic keymaps
-- opts.desc = 'Go to previous diagnostic message'
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--
-- opts.desc = 'Go to next diagnostic message'
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--
-- opts.desc = 'Open floating diagnostic message'
-- vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
--
-- opts.desc = 'Open diagnostics list'
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
--
-- Save and load session
opts.desc = 'Save session'
vim.keymap.set('n', '<leader>ss', ':mksession! .session.vim<CR>', opts)

opts.desc = 'Load session'
vim.keymap.set('n', '<leader>sl', ':source .session.vim<CR>', opts)
