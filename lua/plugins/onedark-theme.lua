--return {
--  "navarasu/onedark.nvim",
--  config = function()
--    -- Lua
--    require("onedark").setup({
--      style = "darker",
--    })
--    require("onedark").load()
--  end,
--}

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
