return {
	"folke/snacks.nvim",
	dependencies = {
		"ibhagwan/fzf-lua",
		"nvim-tree/nvim-web-devicons",
	},
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = {
					auto_close = true,
					layout = {
						{ preview = true },
						layout = {
							box = "horizontal",
							width = 0.8,
							height = 0.8,
							{
								box = "vertical",
								border = "rounded",
								title = "{source} {live} {flags}",
								title_pos = "center",
								{ win = "input", height = 1, border = "bottom" },
								{ win = "list", border = "none" },
							},
							{ win = "preview", border = "rounded", width = 0.7, title = "{preview}" },
						},
					},
				},
			},
		},
		explorer = { enabled = true },
		quickfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = [[
      ,gg,                                     
     i8""8i    I8                              
     `8,,8'    I8                              
      `88'  88888888            gg             
      dP"8,    I8               ""             
     dP' `8a   I8     ,ggggg,   gg     ,gggg,  
    dP'   `Yb  I8    dP"  "Y8ggg88    dP"  "Yb 
_ ,dP'     I8 ,I8,  i8'    ,8I  88   i8'       
"888,,____,dP,d88b,,d8,   ,d8'_,88,_,d8,_    _ 
a8P"Y88888P" 8P""Y8P"Y8888P"  8P""Y8P""Y8888PP ]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						action = ":lua Snacks.dashboard.pick('live_grep')",
						desc = "Find Text",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "s",
						desc = "Restore Session",
						section = "session",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.picker.files({ cwd = '~/.config/nvim/' })",
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
	keys = {
		-- Core pickers
		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Find Files" },
		{ "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
		
		-- Find files
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>fg", function() Snacks.picker.git_files() end, desc = "Git Files" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
		{ "<leader>fc", function() Snacks.picker.files({ cwd = "~/.config/nvim/" }) end, desc = "Config Files" },
		
		-- Git
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
		
		-- Search
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Word", mode = { "n", "x" } },
		{ "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
		{ "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
		{ "<leader>sh", function() Snacks.picker.help() end, desc = "Help" },
		
		-- LSP
		{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "Definition" },
		{ "gr", function() Snacks.picker.lsp_references() end, desc = "References" },
		{ "gI", function() Snacks.picker.lsp_implementations() end, desc = "Implementation" },
		
		-- Utilities
		{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
		{ "<c-/>", function() Snacks.terminal() end, desc = "Terminal" },
	},
}
