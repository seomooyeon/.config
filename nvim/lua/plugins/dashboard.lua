return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
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
a8P"Y88888P" 8P""Y8P"Y8888P"  8P""Y8P""Y8888PP                            
     ,gggg,                                                               
   ,88"""Y8b,                                                        I8   
  d8"     `Y8                                                        I8   
 d8'   8b  d8                                                  gg 88888888
,8I    "Y88P'                                                  ""    I8   
I8'            ,ggggg,    ,ggg,,ggg,,ggg,   ,ggg,,ggg,,ggg,    gg    I8   
d8            dP"  "Y8ggg,8" "8P" "8P" "8, ,8" "8P" "8P" "8,   88    I8   
Y8,          i8'    ,8I  I8   8I   8I   8I I8   8I   8I   8I   88   ,I8,  
`Yba,,_____,,d8,   ,d8' ,dP   8I   8I   Yb,dP   8I   8I   Yb,_,88,_,d88b, 
  `"Y8888888P"Y8888P"   8P'   8I   8I   `Y8P'   8I   8I   `Y88P""Y88P""Y8 
                                                                          
                                                                          
                                                                          
                                                                          ]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.files()" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						action = ":lua Snacks.dashboard.pick('live_grep')",
						desc = "Find Text",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.picker.files({ cwd = '~/.config/nvim/' })",
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			-- Dark green theme styling
			sections = {
				{
					section = "header",
					gap = 1,
					padding = 1,
				},
				{
					section = "keys",
					gap = 1,
					padding = 1,
				},
				{
					section = "startup",
				},
			},
			-- Custom highlight groups for dark green theme
			highlight_groups = {
				DashboardHeader = { fg = "#7dc383", bold = true }, -- Bright green for header
				DashboardKey = { fg = "#5fb3a1", bold = true }, -- Green-teal for key letters
				DashboardDesc = { fg = "#e8f5e8" }, -- Light green-white for descriptions
				DashboardIcon = { fg = "#7dc383" }, -- Green for icons
				DashboardFooter = { fg = "#9cb89c", italic = true }, -- Muted green for footer
			},
		},
		-- Additional styling to complement the theme
		styles = {
			dashboard = {
				bg = "#0d1b0f", -- Match the dark green background from catppuccin config
				border = "rounded",
				padding = 2,
			},
		},
	},
	-- Set up highlights when plugin loads
	config = function(_, opts)
		require("snacks").setup(opts)

		-- Define custom highlight groups for the dashboard
		vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#7dc383", bold = true })
		vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#5fb3a1", bold = true })
		vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#e8f5e8" })
		vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#7dc383" })
		vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#9cb89c", italic = true })

		-- Apply dark green background specifically to dashboard
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "dashboard",
			callback = function()
				vim.wo.winhl = "Normal:Normal,SignColumn:Normal"
				vim.bo.bufhidden = "wipe"
			end,
		})

		-- Custom dashboard styling autocmd
		vim.api.nvim_create_autocmd("User", {
			pattern = "SnacksDashboard",
			callback = function()
				-- Ensure proper background color
				vim.cmd("highlight DashboardNormal guibg=#0d1b0f")
				-- Set window-local highlighting
				if vim.bo.filetype == "dashboard" then
					vim.wo.winhl = "Normal:DashboardNormal"
				end
			end,
		})
	end,
}
