vim.g.mapleader = " "
vim.keymap.set("n", "gt", "<C-w>l", { noremap = true, silent = true }) -- Move to the right split
vim.keymap.set("n", "gp", "<C-w>h", { noremap = true, silent = true }) -- Move to the left split
vim.keymap.set("n", "<leader>q", "<C-q>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gt", ":ToggleTerm<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-x>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
--lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

local opts = {}

require("lazy").setup("plugins")
require("vim-options")
vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	command = "wincmd =",
})

--Yank Highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})
