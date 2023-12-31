-- None-LS former Null-LS
return {
	{
		"nvimtools/none-ls.nvim",
		lazy = false,
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.eslint_d,
					null_ls.builtins.completion.spell,
				},
			})
		end,
	},
}
