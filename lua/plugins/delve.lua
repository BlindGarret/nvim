return {
	{
		'folke/neodev.nvim',
	},
	{
		'mfussenegger/nvim-dap',
	},
	{
		'rcarriga/nvim-dap-ui',
		config = function()
			require('dapui').setup()

			-- Symbols
			vim.fn.sign_define('DapBreakpoint', { text = '🔴', linehl='DapBreakpoint', numhl='DapBreakpoint'})
			vim.fn.sign_define('DapBreakpointContition', { text = '󰟃', linehl='DapBreakpoint', numhl='DapBreakpoint'})
			vim.fn.sign_define('DapBreakpointRejected', { text = '', linehl='DapBreakpoint', numhl='DapBreakpoint'})
			vim.fn.sign_define('DapLogPoint', { text = '', linehl='DapLogPoint', numhl='DapLogPoint'})
			vim.fn.sign_define('DapStopped', { text = '', linehl='DapStopped', numhl='DapStopped'})

			-- Keymaps
			vim.keymap.set('n', '<F3>', function()
				require('dapui').toggle()
			end, {desc = "Toggle Debug UI Panels"})
			vim.keymap.set('n', '<F5>', ':DapContinue<Enter>', { desc = 'Debug: Continue Debug' })
			vim.keymap.set('n', '<C-F5>', ':DapTerminate<Enter>', { desc = 'Debug: Terminate Debug' })
			vim.keymap.set('n', '<F10>', ':DapStepOver<Enter>', { desc = 'Debug: Step Over' })
			vim.keymap.set('n', '<F11>', ':DapStepInto<Enter>', { desc = 'Debug: Step Into' })
			vim.keymap.set('n', '<F12>', ':DapStepOut<Enter>', { desc = 'Debug: Step Out' })
			vim.keymap.set('n', '<M-b>', ':DapToggleBreakpoint<Enter>', { desc = 'Debug: Toggle Breakpoint' })
		end
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		config = function()
			require('nvim-dap-virtual-text').setup()
		end
	},
	{
		'mfussenegger/nvim-dap-python',
		config = function()
			require('dap-python').setup('uv')
		end
	},
	{
		'leoluz/nvim-dap-go',
		config = function() 
			require('dap-go').setup {
				dap_configurations = {
					{
						type = 'go',
						name = 'Attach Remote',
						mode = 'remote',
						request = 'attach',
						connect = {
							host = "127.0.0.1",
							port = "2345"
						}
					},
				},
				delve = {
					port = "2345"
				},
			}
		end
	}
}
