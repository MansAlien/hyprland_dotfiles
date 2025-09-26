local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("keymaps")
require("lazy").setup("plugins")
require("markdown-folding") -- Assumes markdown-folding.lua is in ~/.config/nvim/lua/

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Basic folding setup for non-markdown files
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.foldcolumn = "0"
    vim.opt.foldtext = ""
    vim.opt.foldnestmax = 3
    vim.opt_global.foldlevelstart = 99  -- Set globally
  end,
})

-- Treesitter folding for non-markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "javascript", "typescript", "html", "css", "json" },
  callback = function()
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldlevel = 99  -- Window-local
    -- Remove vim.wo.foldlevelstart here, as it's set globally in VimEnter
  end,
})

-- General folding keymaps (for non-markdown files)
local function close_all_folds()
  vim.cmd("normal! zM")
end

local function open_all_folds()
  vim.cmd("normal! zR")
end

vim.keymap.set("n", "<leader>zs", close_all_folds, { desc = "[s]hut all folds" })
vim.keymap.set("n", "<leader>zo", open_all_folds, { desc = "[o]pen all folds" })
