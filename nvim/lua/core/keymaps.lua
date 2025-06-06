-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>") -- save

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

keymap.set("n", "<leader>1", ":tabn 1<cr>")
keymap.set("n", "<leader>2", ":tabn 2<cr>")
keymap.set("n", "<leader>3", ":tabn 3<cr>")
keymap.set("n", "<leader>4", ":tabn 4<cr>")
keymap.set("n", "<leader>5", ":tabn 5<cr>")

-- Harpoon
local harpoon = require("harpoon")

-- Initialize harpoon
harpoon:setup()

keymap.set("n", "<leader>ha", function()
  harpoon:list():add()
end)

keymap.set("n", "<leader>hh", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

keymap.set("n", "<leader>h1", function()
  harpoon:list():select(1)
end)

keymap.set("n", "<leader>h2", function()
  harpoon:list():select(2)
end)

keymap.set("n", "<leader>h3", function()
  harpoon:list():select(3)
end)

keymap.set("n", "<leader>h4", function()
  harpoon:list():select(4)
end)

keymap.set("n", "<leader>h5", function()
  harpoon:list():select(5)
end)

keymap.set("n", "<leader>h6", function()
  harpoon:list():select(6)
end)

keymap.set("n", "<leader>h7", function()
  harpoon:list():select(7)
end)

keymap.set("n", "<leader>h8", function()
  harpoon:list():select(8)
end)

keymap.set("n", "<leader>h9", function()
  harpoon:list():select(9)
end)

-- Optional: Navigate to next/previous harpoon marks
keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)

keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)
-- Copilot
vim.api.nvim_set_keymap("i", "<c-CR>", 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
vim.g.copilot_no_tab_map = true
