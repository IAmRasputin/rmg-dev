vim.g.go_code_completion_enabled = 0
vim.g.go_list_type = "quickfix"

local function build_go_files()
	local file = vim.fn.expand('%')

	-- Lua patterns use '%' as an escape character and '$' for end-of-string
	-- We use vim.fn.matchset or string.match. 
	-- Here is a clean Lua approach:
	if file:match('_test%.go$') then
		-- Equivalent to call go#test#Test(0, 1)
		vim.fn['go#test#Test'](0, 1)
	elseif file:match('%.go$') then
		-- Equivalent to call go#cmd#Build(0)
		vim.fn['go#cmd#Build'](0)
	end
end

vim.g.go_highlight_types = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_operators = 1
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'

vim.keymap.set('n', '<Leader>gb', ':gb :<C-u>call <SID>build_go_files()<CR>', { remap = true, buf = 0 })
vim.keymap.set('n', '<Leader>gt', '<Plug>(go-test)', { remap = true, buf = 0 })
vim.keymap.set('n', '<Leader>gtf', '<Plug>(go-test-func)', { remap = true, buf = 0 })
vim.keymap.set('n', '<Leader>gr', '<Plug>(go-run)', { remap = true, buf = 0 })
vim.keymap.set('n', '<Leader>gc', '<Plug>(go-coverage-toggle)', { remap = true, buf = 0 })
