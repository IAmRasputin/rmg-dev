vim.api.nvim_create_user_command('FixWhitespace', function()
	vim.cmd([[%s:/\s\+$//e]])
end, {})

local function setup_wrapping()
	vim.opt.wrap = true
	vim.opt.wrapmargin = 2
	vim.opt.textwidth = 79
	vim.opt.breakindent = true
	vim.opt.linebreak = true
end

-- The computer can handle highlighting 400 lines of syntax
local sync_group = vim.api.nvim_create_augroup("vimrc-sync-fromstart", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	group = sync_group,
	pattern = "*",
	command = "syntax sync maxlines=400",
})

-- 2. Remember cursor position
local cursor_group = vim.api.nvim_create_augroup("vimrc-remember-cursor-position", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
	group = cursor_group,
	pattern = "*",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- 3. txt / md wrapping
local wrap_group = vim.api.nvim_create_augroup("vimrc-wrapping", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = wrap_group,
	pattern = { "*.txt", "*.md" },
	callback = setup_wrapping, -- Directly passes the Lua function reference
})

-- 4. make/cmake
local make_cmake_group = vim.api.nvim_create_augroup("vimrc-make-cmake", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = make_cmake_group,
	pattern = "make",
	callback = function()
		vim.opt_local.expandtab = false
	end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = make_cmake_group,
	pattern = "CMakeLists.txt",
	callback = function()
		vim.opt_local.filetype = "cmake"
	end,
})
