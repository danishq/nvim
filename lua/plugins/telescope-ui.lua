return {
	"nvim-telescope/telescope-ui-select.nvim",
	-- This is your opts table
	config = function()
		require("telescope").setup({

			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- even more opts
					}),
				},
			},
		})
		-- To get ui-select loaded and working with telescope, you need to call
		require("telescope").load_extension("ui-select")
	end,
}
