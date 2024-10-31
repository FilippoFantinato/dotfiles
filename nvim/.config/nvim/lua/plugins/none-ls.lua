local latexindent_helper = function()
	local h = require("null-ls.helpers")
	local cmd_resolver = require("null-ls.helpers.command_resolver")
	local methods = require("null-ls.methods")
	local u = require("null-ls.utils")

	local FORMATTING = methods.internal.FORMATTING

	return h.make_builtin({
		name = "latexindent",
		method = { FORMATTING },
		filetypes = {
			"tex",
		},
		generator_opts = {
			command = "latexindent",
			-- args = { "-l" },
			to_stdin = true,
		},
		factory = h.formatter_factory,
	})
end

return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		local nls = require("null-ls")
		local mason_nls = require("mason-null-ls")

		local latexindent = latexindent_helper()

		mason_nls.setup({
			ensure_installed = { "jq", "prettier", "latexindent" },
		})

		nls.setup({
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.completion.spell,
				nls.builtins.formatting.prettier.with({
					extra_args = {
						"--trailing-comma",
						"none",
					},
				}),
				latexindent,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
	end,
}
