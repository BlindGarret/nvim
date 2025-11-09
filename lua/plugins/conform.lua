return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			html = { "prettier" },
			css = { "prettier" },
			htmx = { "prettier" },
			handlebars = { "prettier" },
			go = { "gofmt", "goimports" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			odin = { "odinfmt" }
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
