return {
	{
		"EdenEast/nightfox.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		lazy = false,
		config = function()
			-- load the colorscheme here
			-- -- Default options
			require("nightfox").setup({
				options = {
					-- Compiled file's destination location
					compile_path = vim.fn.stdpath("cache") .. "/nightfox",
					compile_file_suffix = "_compiled", -- Compiled file suffix
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = false, -- Non focused panes set to alternative background
					module_default = true, -- Default enable value for modules
				},
			})

			-- setup must be called before loading
			vim.cmd("colorscheme nightfox")
			vim.cmd([[colorscheme terafox]])
		end,
	},
}
