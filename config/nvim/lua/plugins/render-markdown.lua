-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/render-markdown.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/render-markdown.lua
--
-- https://github.com/MeanderingProgrammer/render-markdown.nvim
-- Using the same highlight style as headlines.nvim
return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  opts = {
    bullet = {
      enabled = true,
    },
    checkbox = {
      enabled = true,
      position = "inline",
      unchecked = {
        icon = "   󰄱 ",
        highlight = "RenderMarkdownUnchecked",
        scope_highlight = nil,
      },
      checked = {
        icon = "   󰱒 ",
        highlight = "RenderMarkdownChecked",
        scope_highlight = nil,
      },
    },
    html = {
      enabled = true,
      comment = {
        conceal = false,
      },
    },
    link = {
      image = vim.g.neovim_mode == "skitty" and "" or "󰥶 ",
      custom = {
        youtu = { pattern = "youtu%.be", icon = "󰗃 " },
      },
    },
    heading = {
      sign = false,
      icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
      backgrounds = {
        "Headline1Bg",
        "Headline2Bg",
        "Headline3Bg",
        "Headline4Bg",
        "Headline5Bg",
        "Headline6Bg",
      },
      foregrounds = {
        "Headline1Fg",
        "Headline2Fg",
        "Headline3Fg",
        "Headline4Fg",
        "Headline5Fg",
        "Headline6Fg",
      },
    },
    code = {
      style = "none",
    },
  },
  config = function(_, opts)
    -- Define highlight groups (same style as headlines.lua)
    vim.cmd([[highlight Headline1Bg guibg=#f265b5 guifg=#323449]])
    vim.cmd([[highlight Headline2Bg guibg=#37f499 guifg=#323449]])
    vim.cmd([[highlight Headline3Bg guibg=#04d1f9 guifg=#323449]])
    vim.cmd([[highlight Headline4Bg guibg=#a48cf2 guifg=#323449]])
    vim.cmd([[highlight Headline5Bg guibg=#f1fc79 guifg=#323449]])
    vim.cmd([[highlight Headline6Bg guibg=#f7c67f guifg=#323449]])
    vim.cmd([[highlight Headline1Fg guifg=#f265b5]])
    vim.cmd([[highlight Headline2Fg guifg=#37f499]])
    vim.cmd([[highlight Headline3Fg guifg=#04d1f9]])
    vim.cmd([[highlight Headline4Fg guifg=#a48cf2]])
    vim.cmd([[highlight Headline5Fg guifg=#f1fc79]])
    vim.cmd([[highlight Headline6Fg guifg=#f7c67f]])
    
    -- Setup plugin AFTER defining highlights
    require("render-markdown").setup(opts)
    
    -- Configure markdown folding
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        -- Simple syntax-based folding that works without treesitter
        vim.opt_local.foldmethod = "syntax"
        vim.opt_local.foldenable = true
        vim.opt_local.foldlevel = 1  -- Start with level 1 headers open
        vim.opt_local.foldnestmax = 6  -- Maximum 6 levels (for h1-h6)
      end,
    })
  end,
}
