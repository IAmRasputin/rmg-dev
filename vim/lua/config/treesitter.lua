require('nvim-treesitter').install({
	"c", 
	"lua", 
	"rust", 
	"go", 
	"python", 
	"bash",
	"commonlisp", 
	"dockerfile", 
	"sql", 
	"vim", 
	"javascript", 
	"vue",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
