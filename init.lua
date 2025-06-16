-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.keymap.set("n", "<leader>q", "<C-q>", { noremap = true, silent = true })
vim.o.swapfile = false
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
