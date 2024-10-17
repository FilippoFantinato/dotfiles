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
		command = "prettier",
		args = { "-l", "~/.indentconfig.yaml" },
	},
	factory = h.formatter_factory,
})
