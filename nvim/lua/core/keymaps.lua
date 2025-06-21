-- Note: Leader key is set in init.lua

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

-- Harpoon keymaps are now configured in lua/plugins/harpoon.lua
-- Copilot
vim.api.nvim_set_keymap("i", "<m-CR>", 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
vim.g.copilot_no_tab_map = true
