vim.keymap.set('v', '>', '>gv', {desc = 'Indent Selection', remap = false})
vim.keymap.set('v', '<', '<gv', {desc = 'Unindent Selection', remap = false})
vim.keymap.set('n', '<M-Up>', ':m .-2<enter>', {desc = 'Move line up'})
vim.keymap.set('n', '<M-Down>', ':m .+1<enter>', {desc = 'Move line down'})
vim.keymap.set('i', '<M-Up>', '<C-o>:m .-2<enter>', {desc = 'Move line up'})
vim.keymap.set('i', '<M-Down>', '<C-o>:m .+1<enter>', {desc = 'Move line down'})
-- vim.keymap.set('i', '<C-d>', '<C-o>:d_<enter>', {desc = 'Delete Line'})
-- vim.keymap.set('n', '<C-d>', ':d_<enter>', {desc = 'Delete Line'})
-- vim.keymap.set('i', '<C-s>', '<C-o>:w<enter>', {desc = 'Save'})
vim.keymap.set('i', '<C-r>', function() vim.lsp.buf.rename() end, {desc = 'Rename'})
vim.keymap.set('n', '<C-r>', function() vim.lsp.buf.rename() end, {desc = 'Rename'})
vim.keymap.set('i', '<F2>', '<C-o>:NvimTreeToggle <enter>', {desc = 'Toggle Tree'})
vim.keymap.set('n', '<F2>', ':NvimTreeToggle <enter>', {desc = 'Toggle Tree'})

vim.keymap.set('n', '<M-C-F>', '<cmd>Telescope live_grep<cr>' , {desc = 'Find in files'})
vim.keymap.set('n', '<M-C-F>', '<cmd>Telescope find_files<cr>' , {desc = 'Find files'})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>' , {desc = 'Escape Terminal'})

vim.keymap.set('n', 'z<Up>', 'zk', {desc = 'Previous Fold'})
vim.keymap.set('n', 'z<Down>', 'zj', {desc = 'Next Fold'})
vim.keymap.set('n', 'ee', '<cmd>lua vim.diagnostic.open_float()<cr>', {desc = 'Show Error'})

-- LSP Keybinds
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP Actions',
	callback = function(event)
		local bufmap = function(mode, lhs, rhs)
			local opts = {buffer = event.buf}
			vim.keymap.set(mode, lhs, rhs, opts)
		end

	-- Code Completion
	bufmap('i', '<C-Space>', '<C-x><C-o>')

	-- Show Hover Docs
	bufmap('n', '<F1>', '<cmd>lua vim.lsp.buf.hover()<cr>')
	
	-- show refs
	bufmap('n', '<M-]>', '<cmd>lua vim.lsp.buf.references()<cr>')
	
	-- Renames all references to the symbol under the cursor
  bufmap('n', '<C-r>r', '<cmd>lua vim.lsp.buf.rename()<cr>')

	-- Show Quick Actions
	bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
	end
})
