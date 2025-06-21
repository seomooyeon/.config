return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
		{ "nvim-lua/plenary.nvim", branch = "master" },
	},
	build = "make tiktoken", -- Only on MacOS or Linux
	event = "VeryLazy",
	opts = {
		model = "claude-sonnet-4",
		system_prompt = "COPILOT_INSTRUCTIONS", -- Base instructions
		agent = "copilot", -- Default agent
		temperature = 0.1, -- Lower temperature for more focused responses

		-- Chat behavior
		auto_follow_cursor = true, -- Follow cursor in chat
		auto_insert_mode = true, -- Enter insert mode when opening
		insert_at_end = true, -- Cursor to end when inserting
		clear_chat_on_new_prompt = false, -- Keep chat history
		chat_autocomplete = true, -- Enable autocompletion

		-- Floating window configuration for chat
		window = {
			layout = "float", -- Floating window
			width = 0.7, -- 60% of screen width
			height = 0.7, -- 70% of screen height
			relative = "editor", -- Relative to editor
			border = "rounded", -- Rounded borders
			title = "Claude", -- Custom title
			row = nil, -- Centered vertically
			col = nil, -- Centered horizontally
			zindex = 50, -- Above other floating windows
		},

		-- Minimal configuration for out-of-the-box chat
		show_help = true, -- Show helpful hints
		highlight_selection = true, -- Highlight selected code
		highlight_headers = true, -- Highlight chat headers
		auto_follow_cursor = true, -- Follow cursor in chat
		auto_insert_mode = true, -- Enter insert mode when opening
		insert_at_end = true, -- Cursor to end when inserting

		-- Simple headers
		question_header = "## You ",
		answer_header = "## Claude ",
		error_header = "## Error ",

		-- Simple default selection
		selection = function(source)
			local select = require("CopilotChat.select")
			return select.visual(source) or select.buffer(source)
		end,

		mappings = {
			close = { normal = "q", insert = "<C-c>" },
			reset = { normal = "<C-l>", insert = "<C-l>" },
			submit_prompt = { normal = "<CR>", insert = "<C-s>" },
			show_help = { normal = "?" },
		},
	},

	-- Essential key mappings
	keys = {
		{ "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
		{ "<leader>ch", "<cmd>CopilotChat<cr>", mode = { "n", "v" }, desc = "Chat with selection" },
		{ "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = { "n", "v" }, desc = "Explain code" },
		{ "<leader>cr", "<cmd>CopilotChatReview<cr>", mode = { "n", "v" }, desc = "Review code" },
		{ "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = { "n", "v" }, desc = "Fix code" },
	},

	-- Simple setup
	config = function(_, opts)
		require("CopilotChat").setup(opts)
	end,
}
