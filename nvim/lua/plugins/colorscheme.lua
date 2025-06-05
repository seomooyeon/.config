-- ~/.config/nvim/lua/plugins/catppuccin.lua
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false,
			show_end_of_buffer = false,
			term_colors = true,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {
				mocha = {
					-- Base colors - dark green background theme
					base = "#0a0f0a", -- Almost black with green tint
					mantle = "#0d120d", -- Slightly lighter
					crust = "#070a07", -- Darkest

					-- Surface colors
					surface0 = "#101510", -- Dark green surface
					surface1 = "#151a15", -- Slightly lighter surface
					surface2 = "#1a201a", -- Medium surface

					-- Text colors - white based
					text = "#ffffff", -- Pure white text
					subtext1 = "#e6e6e6", -- Light gray
					subtext0 = "#cccccc", -- Medium gray

					-- Overlay colors
					overlay0 = "#666666", -- Dark gray
					overlay1 = "#808080", -- Medium gray
					overlay2 = "#999999", -- Light gray

					-- Accent colors - orange theme instead of blue
					blue = "#ff8c42", -- Orange replacing blue
					lavender = "#ffb366", -- Light orange
					sapphire = "#ff7519", -- Dark orange
					sky = "#ffa366", -- Medium orange
					teal = "#4d7c47", -- Green accent
					green = "#66cc66", -- Bright green
					yellow = "#ffcc66", -- Warm yellow
					peach = "#ff9966", -- Peach
					maroon = "#b83329", -- Dark red
					red = "#ff6666", -- Bright red
					mauve = "#cc99cc", -- Purple
					pink = "#ff99cc", -- Pink
					flamingo = "#ff66b3", -- Hot pink
					rosewater = "#ffccdd", -- Light pink
				},
			},
			custom_highlights = function(colors)
				return {
					-- Editor highlights
					Normal = { bg = colors.base, fg = colors.text },
					NormalFloat = { bg = colors.mantle, fg = colors.text },
					CursorLine = { bg = colors.surface0 },
					CursorColumn = { bg = colors.surface0 },
					ColorColumn = { bg = colors.surface0 },

					-- Line numbers
					LineNr = { fg = colors.overlay1 },
					CursorLineNr = { fg = colors.blue, style = { "bold" } }, -- Orange line number

					-- Statusline
					StatusLine = { bg = colors.surface1, fg = colors.text },
					StatusLineNC = { bg = colors.surface0, fg = colors.subtext1 },

					-- Tabline
					TabLine = { bg = colors.surface0, fg = colors.subtext1 },
					TabLineFill = { bg = colors.crust },
					TabLineSel = { bg = colors.surface2, fg = colors.text },

					-- Search
					Search = { bg = colors.blue, fg = colors.base }, -- Orange search highlight
					IncSearch = { bg = colors.peach, fg = colors.base },

					-- Visual selection
					Visual = { bg = colors.surface2 },
					VisualNOS = { bg = colors.surface1 },

					-- Pmenu (completion menu)
					Pmenu = { bg = colors.surface0, fg = colors.text },
					PmenuSel = { bg = colors.blue, fg = colors.base }, -- Orange selection
					PmenuSbar = { bg = colors.surface1 },
					PmenuThumb = { bg = colors.overlay0 },

					-- Syntax highlighting
					Comment = { fg = colors.overlay1, style = { "italic" } },
					Constant = { fg = colors.peach },
					String = { fg = colors.green },
					Character = { fg = colors.teal },
					Number = { fg = colors.peach },
					Boolean = { fg = colors.peach },
					Float = { fg = colors.peach },

					Identifier = { fg = colors.text },
					Function = { fg = colors.blue }, -- Orange functions
					Statement = { fg = colors.mauve },
					Conditional = { fg = colors.mauve, style = { "italic" } },
					Repeat = { fg = colors.mauve, style = { "italic" } },
					Label = { fg = colors.sapphire },
					Operator = { fg = colors.sky },
					Keyword = { fg = colors.mauve },
					Exception = { fg = colors.mauve },

					PreProc = { fg = colors.pink },
					Include = { fg = colors.pink },
					Define = { fg = colors.pink },
					Macro = { fg = colors.pink },
					PreCondit = { fg = colors.pink },

					Type = { fg = colors.yellow },
					StorageClass = { fg = colors.yellow },
					Structure = { fg = colors.yellow },
					Typedef = { fg = colors.yellow },

					Special = { fg = colors.blue }, -- Orange special chars
					SpecialChar = { fg = colors.blue },
					Tag = { fg = colors.blue },
					Delimiter = { fg = colors.overlay2 },
					SpecialComment = { fg = colors.overlay1, style = { "italic" } },
					Debug = { fg = colors.red },

					-- Git signs
					GitSignsAdd = { fg = colors.green },
					GitSignsChange = { fg = colors.yellow },
					GitSignsDelete = { fg = colors.red },

					-- Telescope
					TelescopePromptBorder = { fg = colors.blue },
					TelescopeResultsBorder = { fg = colors.blue },
					TelescopePreviewBorder = { fg = colors.blue },
					TelescopeSelection = { bg = colors.surface1 },
					TelescopeMatching = { fg = colors.blue, style = { "bold" } },

					-- LSP
					DiagnosticError = { fg = colors.red },
					DiagnosticWarn = { fg = colors.yellow },
					DiagnosticInfo = { fg = colors.blue }, -- Orange info
					DiagnosticHint = { fg = colors.teal },

					-- Tree-sitter
					["@variable"] = { fg = colors.text },
					["@variable.builtin"] = { fg = colors.red },
					["@variable.parameter"] = { fg = colors.maroon },
					["@variable.member"] = { fg = colors.text },

					["@constant"] = { fg = colors.peach },
					["@constant.builtin"] = { fg = colors.peach },
					["@constant.macro"] = { fg = colors.peach },

					["@string"] = { fg = colors.green },
					["@string.regex"] = { fg = colors.peach },
					["@string.escape"] = { fg = colors.pink },

					["@character"] = { fg = colors.teal },
					["@character.special"] = { fg = colors.pink },

					["@number"] = { fg = colors.peach },
					["@boolean"] = { fg = colors.peach },
					["@float"] = { fg = colors.peach },

					["@function"] = { fg = colors.blue }, -- Orange functions
					["@function.builtin"] = { fg = colors.blue },
					["@function.call"] = { fg = colors.blue },
					["@function.macro"] = { fg = colors.pink },

					["@method"] = { fg = colors.blue }, -- Orange methods
					["@method.call"] = { fg = colors.blue },

					["@constructor"] = { fg = colors.sapphire },
					["@parameter"] = { fg = colors.maroon },

					["@keyword"] = { fg = colors.mauve },
					["@keyword.function"] = { fg = colors.mauve },
					["@keyword.operator"] = { fg = colors.mauve },
					["@keyword.return"] = { fg = colors.mauve },
					["@keyword.conditional"] = { fg = colors.mauve, style = { "italic" } },
					["@keyword.repeat"] = { fg = colors.mauve, style = { "italic" } },

					["@conditional"] = { fg = colors.mauve, style = { "italic" } },
					["@repeat"] = { fg = colors.mauve, style = { "italic" } },
					["@label"] = { fg = colors.sapphire },

					["@operator"] = { fg = colors.sky },

					["@exception"] = { fg = colors.mauve },

					["@type"] = { fg = colors.yellow },
					["@type.builtin"] = { fg = colors.yellow },
					["@type.definition"] = { fg = colors.yellow },
					["@type.qualifier"] = { fg = colors.pink },

					["@storageclass"] = { fg = colors.yellow },
					["@attribute"] = { fg = colors.blue }, -- Orange attributes
					["@field"] = { fg = colors.text },
					["@property"] = { fg = colors.text },

					["@include"] = { fg = colors.pink },
					["@preproc"] = { fg = colors.pink },
					["@define"] = { fg = colors.pink },
					["@macro"] = { fg = colors.pink },

					["@comment"] = { fg = colors.overlay1, style = { "italic" } },

					["@punctuation.delimiter"] = { fg = colors.overlay2 },
					["@punctuation.bracket"] = { fg = colors.overlay2 },
					["@punctuation.special"] = { fg = colors.blue }, -- Orange special punctuation

					["@tag"] = { fg = colors.blue }, -- Orange tags
					["@tag.attribute"] = { fg = colors.yellow },
					["@tag.delimiter"] = { fg = colors.overlay2 },

					["@text"] = { fg = colors.text },
					["@text.strong"] = { fg = colors.text, style = { "bold" } },
					["@text.emphasis"] = { fg = colors.text, style = { "italic" } },
					["@text.underline"] = { fg = colors.text, style = { "underline" } },
					["@text.strike"] = { fg = colors.text, style = { "strikethrough" } },
					["@text.title"] = { fg = colors.blue, style = { "bold" } }, -- Orange titles
					["@text.literal"] = { fg = colors.green },
					["@text.uri"] = { fg = colors.rosewater, style = { "italic", "underline" } },
					["@text.math"] = { fg = colors.blue }, -- Orange math
					["@text.reference"] = { fg = colors.lavender },
					["@text.environment"] = { fg = colors.pink },
					["@text.environment.name"] = { fg = colors.blue }, -- Orange env names

					["@note"] = { fg = colors.blue }, -- Orange notes
					["@warning"] = { fg = colors.yellow },
					["@danger"] = { fg = colors.red },
				}
			end,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
				telescope = {
					enabled = true,
				},
				lsp_trouble = true,
				which_key = true,
				mason = true,
				noice = true,
				harpoon = true,
				alpha = true,
				dashboard = true,
				flash = true,
				hop = true,
				leap = true,
				lightspeed = true,
				ts_rainbow = true,
				ts_rainbow2 = true,
				illuminate = true,
				indent_blankline = {
					enabled = true,
					scope_color = "lavender",
					colored_indent_levels = false,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
	},
}
