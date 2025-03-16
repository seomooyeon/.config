return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			preset = {
				header = [[
      ,gg,                                                            
     i8""8i   I8                                                      
     `8,,8'   I8                                                      
      `88' 88888888          gg                                       
      dP"8,   I8             ""                                       
     dP' `8a  I8    ,ggggg,  gg    ,gggg,                             
    dP'   `Yb I8   dP"  "Y8gg88   dP"  "Yb                            
_ ,dP'     I8,I8, i8'    ,8I 88  i8'                                  
"888,,____,d,d88b,d8,   ,d8_,88,,d8,_    _                            
a8P"Y88888P"8P""YP"Y8888P" 8P""YP""Y8888PP                            
     ,gggg,                                                           
   ,88"""Y8b,                                                    I8   
  d8"     `Y8                                                    I8   
 d8'   8b  d8                                               gg88888888
,8I    "Y88P'                                               ""   I8   
I8'           ,ggggg,   ,ggg,,ggg,,ggg,   ,ggg,,ggg,,ggg,   gg   I8   
d8           dP"  "Y8gg,8" "8P" "8P" "8, ,8" "8P" "8P" "8,  88   I8   
Y8,         i8'    ,8I I8   8I   8I   8I I8   8I   8I   8I  88  ,I8,  
`Yba,,_____,d8,   ,d8',dP   8I   8I   Yb,dP   8I   8I   Yb_,88,,d88b, 
  `"Y888888P"Y8888P"  8P'   8I   8I   `Y8P'   8I   8I   `Y8P""Y8P""Y8 
                                                                      
                                                                      
                                                                      
      ]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
}
