return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "horizontal",
			size = 15,
			shade_terminals = true,
			start_in_insert = true,
			persist_mode = false,
			persist_size = false,
			close_on_exit = true,
			autochdir = true, -- Automatically change terminal directory
		})

		vim.api.nvim_set_keymap("n", "<leader>gt", ":lua OpenToggleTerm()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("t", "<C-x>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })

		function OpenToggleTerm()
			local file_dir = vim.fn.expand("%:p:h") -- Get current file directory
			vim.cmd("cd " .. file_dir) -- Change working directory
			vim.cmd("ToggleTerm") -- Open terminal
		end
	end,
}
