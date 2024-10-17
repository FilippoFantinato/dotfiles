return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "texlab" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.textlsp.setup({})
			lspconfig.rust_analyzer.setup({})
			lspconfig.texlab.setup({
				settings = {
					texlab = {
						bibtexFormatter = "texlab",
						build = {
							args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
							executable = "latexmk",
							forwardSearchAfter = true,
						},
						chktex = {
							onEdit = false,
							onOpenAndSave = true,
						},
						diagnosticsDelay = 300,
						formatterLineLength = 120,
						forwardSearch = {
							executable = "zathura",
							args = {
								"--synctex-forward",
								"%l:1:%f",
								"%p",
							},
						},
						latexFormatter = "latexindent",
						latexindent = {
							modifyLineBreaks = true,
							["local"] = "/home/filippofantinato/.indentconfig.yaml",
						},
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
