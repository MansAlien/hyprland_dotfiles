return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "benfowler/telescope-luasnip.nvim", -- 🔥 Add this
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      -- Keymaps
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

      -- Setup
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          },
        },
      })

      -- Load extensions
      telescope.load_extension("ui-select")
      telescope.load_extension("luasnip") -- 🔥 Load luasnip extension
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
}

