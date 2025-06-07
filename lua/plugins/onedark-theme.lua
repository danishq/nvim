return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
    })
  end,
}
--return {
--  "navarasu/onedark.nvim",
--  priority = 1000, -- make sure to load this before all the other start plugins
--  config = function()
--    require("onedark").setup({
--      style = "darker",
--    })
--    -- Enable theme
--    require("onedark").load()
--  end,
--}
