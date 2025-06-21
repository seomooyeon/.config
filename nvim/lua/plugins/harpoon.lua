-- List of favorite files/marks per project
return {
  -- https://github.com/ThePrimeagen/harpoon
  'ThePrimeagen/harpoon',
  branch = "harpoon2",
  event = 'VeryLazy',
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    'nvim-lua/plenary.nvim',
  },
  opts = {
    menu = {
      width = 120
    }
  },
  config = function()
    local harpoon = require("harpoon")
    
    -- Initialize harpoon
    harpoon:setup({
      menu = {
        width = 120
      }
    })

    local keymap = vim.keymap

    -- Harpoon keymaps
    keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Harpoon add file" })

    keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon quick menu" })

    keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon select 1" })

    keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon select 2" })

    keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon select 3" })

    keymap.set("n", "<leader>h4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon select 4" })

    keymap.set("n", "<leader>h5", function()
      harpoon:list():select(5)
    end, { desc = "Harpoon select 5" })

    keymap.set("n", "<leader>h6", function()
      harpoon:list():select(6)
    end, { desc = "Harpoon select 6" })

    keymap.set("n", "<leader>h7", function()
      harpoon:list():select(7)
    end, { desc = "Harpoon select 7" })

    keymap.set("n", "<leader>h8", function()
      harpoon:list():select(8)
    end, { desc = "Harpoon select 8" })

    keymap.set("n", "<leader>h9", function()
      harpoon:list():select(9)
    end, { desc = "Harpoon select 9" })

    -- Navigate to next/previous harpoon marks
    keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon previous" })

    keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Harpoon next" })
  end,
}

