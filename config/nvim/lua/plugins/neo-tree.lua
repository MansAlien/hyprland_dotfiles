return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Setup neo-tree with basic configuration
    require("neo-tree").setup {
      filesystem = {
        follow_current_file = {
          enabled = true, -- This replaces the old `true/false`
          leave_dirs_open = false, -- optional: closes dirs not related to current file
        },
        hijack_netrw_behavior = "open_current", -- Open files in the current window
        use_libuv_file_watcher = true, -- Improves file watching performance
      },
      window = {
        mappings = {
          ["<cr>"] = "open", -- Default mapping to open files
          ["o"] = "open",    -- Alternative mapping
        },
      },
      default_component_configs = {
        indent = {
          padding = 0, -- Adjust padding if needed
        },
      },
    }

    -- Keymap to toggle neo-tree
    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true })
  end,
}
