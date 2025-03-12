--return {
--    'nvim-lualine/lualine.nvim',
--    dependencies = { 'nvim-tree/nvim-web-devicons' },
--    config = function()
--      require('lualine').setup({
--        options = {
--          icons_enabled = true,
--          theme = 'molokai',
--        }
--      })
--    end
--}
--Another config file -- working**
--return {
--	"nvim-lualine/lualine.nvim",
--	dependencies = { "shaunsingh/nord.nvim" },
--	config = function()
--		require("lualine").setup({
--			options = {
--				theme = "nord",
--			},
--		})
--	end,
--}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "shaunsingh/nord.nvim" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "nord",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename" },
				lualine_x = {
					"encoding",
					"fileformat",
					"filetype",
					{
						function()
							local mem_used = collectgarbage("count") / 1024
							return string.format("RAM: %.2f MB", mem_used)
						end,
						icon = "", -- Memory icon
					},
				},
				lualine_y = {
					{
						function()
							return os.date("%I:%M %p") -- 12-hour format with AM/PM
						end,
						icon = "", -- Clock icon
					},
				},
				lualine_z = { "location" },
			},
		})
	end,
}
