-- LSP Support
return {
	-- LSP Configuration
	-- https://github.com/neovim/nvim-lspconfig
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		-- LSP Management
		-- https://github.com/williamboman/mason.nvim
		{ "williamboman/mason.nvim" },
		-- https://github.com/williamboman/mason-lspconfig.nvim
		{ "williamboman/mason-lspconfig.nvim" },

		-- Auto-Install LSPs, linters, formatters, debuggers
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

		-- Useful status updates for LSP
		-- https://github.com/j-hui/fidget.nvim
		{ "j-hui/fidget.nvim", opts = {} },

		-- Additional lua configuration, makes nvim stuff amazing!
		-- https://github.com/folke/neodev.nvim
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		require("mason").setup({
			registries = {
				"github:nvim-java/mason-registry",
				"github:mason-org/mason-registry",
			},
		})
		require("mason-lspconfig").setup({
			-- Install these LSPs automatically
			ensure_installed = {
				"bashls",
				"cssls",
				"html",
				"groovyls",
				"lua_ls",
				"jdtls",
				"jsonls",
				"lemminx",
				"marksman",
				"quick_lint_js",
				"yamlls",
				"gradle_ls",
			},
		})

		require("mason-tool-installer").setup({
			-- Install these linters, formatters, debuggers automatically
			ensure_installed = {
				"java-debug-adapter",
				"java-test",
				"stylua",
				"google-java-format",
			},
		})

		-- There is an issue with mason-tools-installer running with VeryLazy, since it triggers on VimEnter which has already occurred prior to this plugin loading so we need to call install explicitly
		-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim/issues/39
		vim.api.nvim_command("MasonToolsInstall")

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lsp_attach = function(client, bufnr)
			-- Create your keybindings here...
		end

		-- Call setup on each LSP server
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				-- Don't call setup for JDTLS Java LSP because it will be setup from a separate config
				if server_name ~= "jdtls" then
					lspconfig[server_name].setup({
						on_attach = lsp_attach,
						capabilities = lsp_capabilities,
					})
				end
			end,
		})

		-- Lua LSP settings
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		-- Globally configure all LSP floating preview popups (like hover, signature help, etc)
		local open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = "rounded" -- Set border to rounded
			return open_floating_preview(contents, syntax, opts, ...)
		end
		-- LSP
		local keymap = vim.keymap
		keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
		keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
		keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
		keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
		keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
		keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		keymap.set("n", "rr", "<cmd>lua vim.lsp.buf.rename()<CR>")
		keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
		keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
		keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
		keymap.set("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
		keymap.set("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
		keymap.set("n", "tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
		keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")

		-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
		keymap.set("n", "<leader>go", function()
			if vim.bo.filetype == "java" then
				require("jdtls").organize_imports()
			end
		end)

		keymap.set("n", "<leader>gu", function()
			if vim.bo.filetype == "java" then
				require("jdtls").update_projects_config()
			end
		end)

		keymap.set("n", "<leader>tc", function()
			if vim.bo.filetype == "java" then
				require("jdtls").test_class()
			end
		end)

		keymap.set("n", "<leader>tm", function()
			if vim.bo.filetype == "java" then
				require("jdtls").test_nearest_method()
			end
		end)
	end,
}
