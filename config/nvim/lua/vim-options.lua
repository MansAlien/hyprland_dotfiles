vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.wo.number = true

-- Enable treesitter folding for markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt_local.foldenable = true
    vim.opt_local.foldlevel = 1 -- Start with level 1 headers open
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

-- Spell checking only for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" }, -- add more if needed
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en" } -- or { "en", "ar" } if you want both
  end,
})

-- Toggle spell checking (buffer-local)
vim.keymap.set('n', '<leader>ss', function()
  vim.opt_local.spell = not vim.opt_local.spell:get()
  if vim.opt_local.spell:get() then
    print("Spell checking enabled (buffer)")
  else
    print("Spell checking disabled (buffer)")
  end
end, { desc = "Toggle spell checking" })

-- Navigate to next/previous spelling error
vim.keymap.set('n', ']s', ']s', { desc = "Next spelling error" })
vim.keymap.set('n', '[s', '[s', { desc = "Previous spelling error" })

-- Add word under cursor to dictionary
vim.keymap.set('n', 'zg', 'zg', { desc = "Add word to dictionary" })

