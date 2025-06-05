-- Add this as a separate plugin configuration in your lazy.nvim setup
return {
	"echasnovski/mini.icons",
	lazy = true,
	opts = function()
		local hi = require("mini.icons")
		return {
			-- Custom icon styles for dark green theme
			style = "glyph", -- or "ascii" if you prefer

			-- Extension-specific customizations
			extension = {
				lua = { glyph = "󰢱", hl = "MiniIconsBlue" },
				py = { glyph = "󰌠", hl = "MiniIconsYellow" },
				js = { glyph = "󰌞", hl = "MiniIconsYellow" },
				ts = { glyph = "󰛦", hl = "MiniIconsBlue" },
				json = { glyph = "󰘦", hl = "MiniIconsOrange" },
				md = { glyph = "󰍔", hl = "MiniIconsWhite" },
				txt = { glyph = "󰈙", hl = "MiniIconsGray" },
				vim = { glyph = "󰕷", hl = "MiniIconsGreen" },
				yml = { glyph = "󰈙", hl = "MiniIconsRed" },
				yaml = { glyph = "󰈙", hl = "MiniIconsRed" },
				toml = { glyph = "󰈙", hl = "MiniIconsOrange" },
				css = { glyph = "󰌜", hl = "MiniIconsBlue" },
				html = { glyph = "󰌝", hl = "MiniIconsOrange" },
				sh = { glyph = "󱆃", hl = "MiniIconsGreen" },
				zsh = { glyph = "󱆃", hl = "MiniIconsGreen" },
				fish = { glyph = "󰈺", hl = "MiniIconsGreen" },
				go = { glyph = "󰟓", hl = "MiniIconsBlue" },
				rs = { glyph = "󱘗", hl = "MiniIconsRed" },
				c = { glyph = "󰙱", hl = "MiniIconsBlue" },
				cpp = { glyph = "󰙲", hl = "MiniIconsBlue" },
				java = { glyph = "󰬷", hl = "MiniIconsRed" },
				rb = { glyph = "󰴭", hl = "MiniIconsRed" },
				php = { glyph = "󰌟", hl = "MiniIconsPurple" },
				swift = { glyph = "󰛥", hl = "MiniIconsOrange" },
				kt = { glyph = "󱈙", hl = "MiniIconsPurple" },
				dart = { glyph = "󰯸", hl = "MiniIconsBlue" },
			},

			-- Filename-specific customizations
			file = {
				[".gitignore"] = { glyph = "󰊢", hl = "MiniIconsRed" },
				["Dockerfile"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
				["docker-compose.yml"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
				["README.md"] = { glyph = "󰍔", hl = "MiniIconsYellow" },
				["package.json"] = { glyph = "󰎙", hl = "MiniIconsGreen" },
				["Cargo.toml"] = { glyph = "󰏗", hl = "MiniIconsRed" },
				["go.mod"] = { glyph = "󰟓", hl = "MiniIconsBlue" },
				["requirements.txt"] = { glyph = "󰌠", hl = "MiniIconsYellow" },
				["Gemfile"] = { glyph = "󰴭", hl = "MiniIconsRed" },
				["Makefile"] = { glyph = "󱁤", hl = "MiniIconsGray" },
				["CMakeLists.txt"] = { glyph = "󰔷", hl = "MiniIconsGray" },
			},

			-- Directory-specific customizations
			filetype = {
				["neo-tree"] = { glyph = "󰙅", hl = "MiniIconsGreen" },
				["nvim-tree"] = { glyph = "󰙅", hl = "MiniIconsGreen" },
				["oil"] = { glyph = "󰙅", hl = "MiniIconsGreen" },
				["fugitive"] = { glyph = "󰊢", hl = "MiniIconsRed" },
				["gitcommit"] = { glyph = "󰊢", hl = "MiniIconsRed" },
				["help"] = { glyph = "󰋖", hl = "MiniIconsYellow" },
				["man"] = { glyph = "󰗚", hl = "MiniIconsYellow" },
				["lazy"] = { glyph = "󰒲", hl = "MiniIconsPurple" },
				["mason"] = { glyph = "󰆧", hl = "MiniIconsOrange" },
				["terminal"] = { glyph = "󰆍", hl = "MiniIconsGreen" },
			},

			-- Default directory icon
			default = {
				directory = { glyph = "󰉋", hl = "MiniIconsGreen" },
				file = { glyph = "󰈙", hl = "MiniIconsGray" },
			},
		}
	end,

	-- Configure colors that work well with dark green backgrounds
	config = function(_, opts)
		require("mini.icons").setup(opts)

		-- Define custom highlight groups that complement dark green themes
		local function setup_highlights()
			-- Define colors that work well with dark green backgrounds
			local colors = {
				-- Bright colors for contrast against dark green
				white = "#ffffff",
				gray = "#a0a0a0",
				light_gray = "#d0d0d0",

				-- Complementary colors
				red = "#ff6b6b",
				orange = "#ffa500",
				yellow = "#ffeb3b",
				green = "#4caf50",
				light_green = "#8bc34a",
				blue = "#2196f3",
				light_blue = "#64b5f6",
				purple = "#9c27b0",
				pink = "#e91e63",

				-- Muted versions for secondary elements
				muted_red = "#e57373",
				muted_orange = "#ffb74d",
				muted_yellow = "#fff176",
				muted_blue = "#64b5f6",
				muted_purple = "#ba68c8",
			}

			-- Set up highlight groups
			vim.api.nvim_set_hl(0, "MiniIconsWhite", { fg = colors.white })
			vim.api.nvim_set_hl(0, "MiniIconsGray", { fg = colors.gray })
			vim.api.nvim_set_hl(0, "MiniIconsRed", { fg = colors.red })
			vim.api.nvim_set_hl(0, "MiniIconsOrange", { fg = colors.orange })
			vim.api.nvim_set_hl(0, "MiniIconsYellow", { fg = colors.yellow })
			vim.api.nvim_set_hl(0, "MiniIconsGreen", { fg = colors.light_green })
			vim.api.nvim_set_hl(0, "MiniIconsBlue", { fg = colors.blue })
			vim.api.nvim_set_hl(0, "MiniIconsPurple", { fg = colors.purple })
			vim.api.nvim_set_hl(0, "MiniIconsPink", { fg = colors.pink })

			-- Muted versions
			vim.api.nvim_set_hl(0, "MiniIconsMutedRed", { fg = colors.muted_red })
			vim.api.nvim_set_hl(0, "MiniIconsMutedOrange", { fg = colors.muted_orange })
			vim.api.nvim_set_hl(0, "MiniIconsMutedYellow", { fg = colors.muted_yellow })
			vim.api.nvim_set_hl(0, "MiniIconsMutedBlue", { fg = colors.muted_blue })
			vim.api.nvim_set_hl(0, "MiniIconsMutedPurple", { fg = colors.muted_purple })
		end

		-- Set up highlights on VimEnter and ColorScheme events
		vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
			callback = setup_highlights,
			desc = "Setup mini.icons highlights for dark green theme",
		})

		-- Set up highlights immediately if already loaded
		if vim.fn.has("vim_starting") == 0 then
			setup_highlights()
		end
	end,
}
