vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.cmd([[ set tw=120 ]])
	end,
})

vim.lsp.enable("ruff")
vim.lsp.enable("pylsp")

vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				autopep8 = { enabled = false },
				pycodestyle = { enabled = false },
				pyflakes = { enabled = false },
				pylint = { enabled = false },
				yapf = { enabled = false },
				rope_autoimport = { enabled = true },
				rope_completion = { enabled = true },
			},
		},
	},
	on_attach = function(client, _)
		-- Disable formatting in favor of ruff
		client.server_capabilities.documentFormattingProvider = false
	end,
})
