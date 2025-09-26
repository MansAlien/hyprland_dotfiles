vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- Set languages (English + Arabic)
vim.opt.spelllang = { "en" }

vim.wo.number = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" }, -- add more if needed
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en" } -- both English & Arabic
  end,
})


-- Enable treesitter folding for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt_local.foldenable = true
    vim.opt_local.foldlevel = 1  -- Start with level 1 headers open
  end,
})

-- Folding keymaps
vim.keymap.set('n', 'zo', 'zo', { desc = 'Open fold' })
vim.keymap.set('n', 'zc', 'zc', { desc = 'Close fold' })
vim.keymap.set('n', 'za', 'za', { desc = 'Toggle fold' })
vim.keymap.set('n', 'zR', 'zR', { desc = 'Open all folds' })
vim.keymap.set('n', 'zM', 'zM', { desc = 'Close all folds' })
vim.keymap.set('n', 'zr', 'zr', { desc = 'Reduce fold level' })
vim.keymap.set('n', 'zm', 'zm', { desc = 'Increase fold level' })
