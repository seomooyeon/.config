local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation  
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false
opt.wrap = false
opt.scrolloff = 10

-- Clipboard (WSL-friendly)
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
else
	vim.schedule(function()
		opt.clipboard = "unnamedplus"
	end)
end

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Files
opt.swapfile = false
opt.undofile = true

-- Timing
opt.updatetime = 250
opt.timeoutlen = 300

-- Whitespace display
opt.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Other
opt.mouse = "a"
opt.breakindent = true
opt.inccommand = "split"

-- Better completion
opt.completeopt = { "menuone", "noselect", "noinsert" }
opt.pumheight = 10 -- Popup menu height

-- Better search
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Show search results as you type

-- Better editing
opt.virtualedit = "block" -- Allow cursor to move anywhere in visual block mode
opt.whichwrap = "bs<>[]hl" -- Allow backspace and cursor keys to cross line boundaries

-- Performance optimizations (especially for WSL)
opt.lazyredraw = false -- Don't redraw during macros (can cause issues in WSL)
opt.synmaxcol = 300 -- Limit syntax highlighting for long lines
opt.foldmethod = "manual" -- Manual folding for better performance
if vim.fn.has("wsl") == 1 then
	opt.ttimeoutlen = 50 -- Faster key sequence timeout in WSL
	opt.ttyfast = true -- Assume fast terminal connection
end
