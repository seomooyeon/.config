return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			enabled = true, -- enables the Noice cmdline UI
			opts = {}, -- global options for the cmdline. See section on views
			format = {
				-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
				-- view: (default is cmdline view)
				-- opts: any options passed to the view
				-- icon_hl_group: optional hl_group for the icon
				-- title: set to anything or empty string to hide
				cmdline = {
					pattern = "^:",
					icon = "",
					lang = "vim",
					title = "Command Line",
				},
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
				-- lua = false, -- to disable a format, set to `false`
			},
		},
		-- Messages and command line styling
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		-- Popup menu styling
		popupmenu = {
			enabled = true,
			backend = "nui",
		},
		-- Notification styling
		notify = {
			enabled = true,
			view = "notify",
		},
		-- LSP progress styling
		lsp = {
			progress = {
				enabled = true,
				format = "lsp_progress",
				format_done = "lsp_progress_done",
				throttle = 1000 / 30,
				view = "mini",
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = true,
				silent = false,
				view = nil,
				opts = {},
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true,
					luasnip = true,
					throttle = 50,
				},
				view = nil,
				opts = {},
			},
			message = {
				enabled = true,
				view = "notify",
				opts = {},
			},
			documentation = {
				view = "hover",
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
		},
		-- Health check
		health = {
			checker = false,
		},
		-- Smart move
		smart_move = {
			enabled = true,
			excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
		},
		-- Presets for easier configuration
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
		-- Views configuration for dark green theme
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				filter_options = {},
				win_options = {
					winhighlight = "Normal:NoiceCmdlinePopupNormal,FloatBorder:NoiceCmdlinePopupBorder",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = "Normal:NoicePopupmenuNormal,FloatBorder:NoicePopupmenuBorder,CursorLine:NoicePopupmenuSelected",
				},
			},
			hover = {
				border = {
					style = "rounded",
				},
				position = { row = 2, col = 2 },
				win_options = {
					winhighlight = "Normal:NoiceHoverNormal,FloatBorder:NoiceHoverBorder",
				},
			},
			confirm = {
				border = {
					style = "rounded",
				},
				win_options = {
					winhighlight = "Normal:NoiceConfirmNormal,FloatBorder:NoiceConfirmBorder",
				},
			},
			split = {
				win_options = {
					winhighlight = "Normal:NoiceSplitNormal",
				},
			},
		},
		-- Routes for filtering messages
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		"ibhagwan/fzf-lua",
	},
	config = function(_, opts)
		require("noice").setup(opts)

		-- Define dark green theme highlight groups for Noice
		local highlights = {
			-- Command line popup
			NoiceCmdlinePopupNormal = { bg = "#0d1b0f", fg = "#e8f5e8" },
			NoiceCmdlinePopupBorder = { bg = "#0d1b0f", fg = "#7dc383" },
			NoiceCmdlinePopupTitle = { bg = "#0d1b0f", fg = "#7dc383", bold = true },

			-- Regular command line
			NoiceCmdlineNormal = { bg = "#1a2f1d", fg = "#e8f5e8" },
			NoiceCmdlineBorder = { bg = "#1a2f1d", fg = "#5fb3a1" },
			NoiceCmdlineIcon = { fg = "#7dc383" },
			NoiceCmdlineIconCmdline = { fg = "#7dc383" },
			NoiceCmdlineIconSearch = { fg = "#5fb3a1" },
			NoiceCmdlineIconFilter = { fg = "#fab387" },
			NoiceCmdlineIconLua = { fg = "#7aa3f0" },
			NoiceCmdlineIconHelp = { fg = "#cba6f7" },

			-- Popup menu
			NoicePopupmenuNormal = { bg = "#1a2f1d", fg = "#e8f5e8" },
			NoicePopupmenuBorder = { bg = "#1a2f1d", fg = "#5fb3a1" },
			NoicePopupmenuSelected = { bg = "#233829", fg = "#7dc383", bold = true },
			NoicePopupmenuMatch = { fg = "#7dc383", bold = true },

			-- Hover documentation
			NoiceHoverNormal = { bg = "#0d1b0f", fg = "#e8f5e8" },
			NoiceHoverBorder = { bg = "#0d1b0f", fg = "#5fb3a1" },

			-- Confirm dialogs
			NoiceConfirmNormal = { bg = "#1a2f1d", fg = "#e8f5e8" },
			NoiceConfirmBorder = { bg = "#1a2f1d", fg = "#7dc383" },

			-- Split view
			NoiceSplitNormal = { bg = "#0d1b0f", fg = "#e8f5e8" },

			-- Mini view (for LSP progress, etc.)
			NoiceMini = { bg = "#233829", fg = "#e8f5e8" },

			-- LSP progress
			NoiceLspProgressSpinner = { fg = "#7dc383" },
			NoiceLspProgressTitle = { fg = "#e8f5e8" },
			NoiceLspProgressClient = { fg = "#5fb3a1" },

			-- Format highlights
			NoiceFormatProgressDone = { fg = "#7dc383", bg = "#233829" },
			NoiceFormatProgressTodo = { fg = "#5c8a5c", bg = "#1a2f1d" },

			-- Virtual text
			NoiceVirtualText = { fg = "#9cb89c", italic = true },

			-- Search
			NoiceSearchCount = { fg = "#7dc383", bg = "#233829" },

			-- Cursor
			NoiceCursor = { fg = "#0d1b0f", bg = "#7dc383" },
		}

		-- Apply all highlight groups
		for group, colors in pairs(highlights) do
			vim.api.nvim_set_hl(0, group, colors)
		end

		-- Additional autocmds for consistent theming
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				-- Reapply highlights when colorscheme changes
				for group, colors in pairs(highlights) do
					vim.api.nvim_set_hl(0, group, colors)
				end
			end,
		})
	end,
}
