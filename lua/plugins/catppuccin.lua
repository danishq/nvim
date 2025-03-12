return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	--Theme catppuccin
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
