return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      --open_mapping = [[<leader>gt]], -- Open terminal with <leader>gt
      direction = "float", -- You can change this to "horizontal" or "vertical"
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Keybindings
      vim.keymap.set("n", "<leader>gt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
      vim.keymap.set("t", "<leader>gtt", "<cmd>ToggleTermToggleAll<CR>", { desc = "Hide All Terminals" })
    end,
  },
}
