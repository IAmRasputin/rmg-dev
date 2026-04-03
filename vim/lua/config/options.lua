vim.opt.completeopt = {'menu', 'menuone', 'noinsert', 'noselect'}

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'

vim.opt.backspace = {'indent', 'eol', 'start'}

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hidden = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.fileformats = {'unix', 'dos', 'mac'}

vim.opt.shell = '/bin/zsh'

vim.opt.ruler = true
vim.opt.number = true

vim.opt.wildmenu = true

vim.opt.mouse = 'a'
vim.opt.mousemodel = 'popup'

-- vim.opt.t_Co = 256

-- In terminal mode, stop auto-scrolling when text is entered
vim.api.nvim_create_autocmd("TermEnter", {
	pattern = '*',
	callback = function()
		vim.opt_local.scrolloff = 0
	end,
})
vim.api.nvim_create_autocmd("TermLeave", {
	pattern = '*',
	callback = function()
		vim.opt_local.scrolloff = 3
	end,
})

vim.opt.laststatus = 2

vim.opt.modeline = true
vim.opt.modelines = 10

vim.opt.titlestring = '%F'

vim.opt.clipboard = {'unnamed', 'unnamedplus'}
