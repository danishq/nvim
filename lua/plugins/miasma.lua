--return {
--	"xero/miasma.nvim",
--	lazy = false, -- Load immediately
--	priority = 1000, -- Load before other plugins
--	config = function()
--		-- Ensure colorscheme is applied after UI is fully loaded
--		vim.defer_fn(function()
--			vim.cmd("colorscheme miasma")
--		end, 0)
--	end,
--}
return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.defer_fn(function()
			vim.cmd("colorscheme nord")
		end, 0)
	end,
}
