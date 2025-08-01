-- Comment/Uncomment Lines of Code
return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in javascript template_string
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		opts = {},
	},
	{
		"tpope/vim-commentary",
		event = "VeryLazy",
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = { ensure_installed = { "prettier", "stylua" } },
			},
		},
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
					python = { "black" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = vim.fn.has("wsl") == 1 and 5000 or 3000, -- Longer timeout for WSL
				},
			})
		end,
	},
}
