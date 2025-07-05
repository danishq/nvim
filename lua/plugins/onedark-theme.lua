--return {
--  --"catppuccin/nvim",
--  --name = "catppuccin",
--  --priority = 1000,
--  --config = function()
--  --  require("catppuccin").setup({
--  --    flavour = "macchiato",
--  --  })
--  --end,
--
--  "zenbones-theme/zenbones.nvim",
--  -- Optionally install Lush. Allows for more configuration or extending the colorscheme
--  -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
--  -- In Vim, compat mode is turned on as Lush only works in Neovim.
--  dependencies = "rktjmp/lush.nvim",
--  lazy = false,
--  priority = 1000,
--  -- you can set set configuration options here
--  -- config = function()
--  --     vim.g.zenbones_darken_comments = 45
--  --     vim.cmd.colorscheme('zenbones')
--  -- end
--}
return {
  "navarasu/onedark.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("onedark").setup({
      style = "darker",
    })
    -- Enable theme
    require("onedark").load()
  end,
}
