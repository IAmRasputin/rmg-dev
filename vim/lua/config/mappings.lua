vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Let me escape in terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Quickfix navigation
vim.keymap.set('', '<C-n>', ':cnext<CR>')
vim.keymap.set('', '<C-m>', ':cprevious<CR>')
vim.keymap.set('', '<leader>a', ':cclose<CR>')

-- Search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')


-- You know what I mean, vim
vim.keymap.set('ca', 'W!', 'w!')
vim.keymap.set('ca', 'Q!', 'q!')
vim.keymap.set('ca', 'Qall!', 'qall!')
vim.keymap.set('ca', 'Wq', 'wq')
vim.keymap.set('ca', 'Wa', 'wa')
vim.keymap.set('ca', 'wQ', 'wq')
vim.keymap.set('ca', 'WQ', 'wq')
vim.keymap.set('ca', 'W', 'w')
vim.keymap.set('ca', 'Q', 'q')
vim.keymap.set('ca', 'Qall', 'qall')

-- Terminal emulator
vim.keymap.set('n', '<leader>sh', ':botright terminal')

-- Tabs
vim.keymap.set('n', '<leader><Tab>', 'gt')
vim.keymap.set('n', '<leader><S-Tab>', 'gT')
vim.keymap.set('n', '<S-t>', ':tabnew<CR>')

-- Set current working directory and use in commands
vim.keymap.set('n', '<leader>.', ':lcd %:p:h<CR>')
vim.keymap.set('', '<leader>te', ':tabe <C-R>=expand("%:p:h") . "/" <CR>')
vim.keymap.set('c', '<C-P>', '<C-R>=expand("%:p:h") . "/" <CR>')

-- Buffers
vim.keymap.set('n', '<leader>b', ':Buffers<CR>')
vim.keymap.set('', '<S-Tab>', ':bp<CR>')
vim.keymap.set('', '<leader>q', ':bp<CR>')
vim.keymap.set('', '<Tab>', ':bn<CR>')
vim.keymap.set('', '<leader>w', ':bn<CR>')

-- Windows
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-l>', '<C-w>l')

-- Stay in visual mode after shifting around with < or >
vim.keymap.set('v', '<', '<gv', { remap = true })
vim.keymap.set('v', '>', '>gv', { remap = true })

-- Move visual block
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")


-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>ft', '<cmd>Telescope file_browser<cr>')
