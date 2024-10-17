return {
	"lervag/vimtex",
  enabled = false,
	dependencies = {
		"conornewton/vim-latex-preview",
	},
	lazy = false,
	config = function()
		vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_format_enabled = 0
		-- vim.g.tex_flavor = "latex"
		-- vim.g.tex_conceal = "abdmgs"
		-- vim.g.vimtex_quickfix_mode = 0
		-- vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-lualatex" }
		-- vim.g.vimtex_view_enabled = 0
		-- vim.g.vimtex_view_automatic = 0
		-- vim.g.vimtex_indent_on_ampersands = 0
	end,
}
