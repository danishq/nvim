-- Using ts_ls instead of deprecated tsserver
return {
	-- Mason: Ensures LSP servers are installed
	{
		"williamboman/mason.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ts_ls", "jdtls", "clangd" }, -- ✅ Fixed TypeScript LSP name
				automatic_installation = true,
			})
		end,
	},
	-- Neovim LSP Configuration
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		priority = 1000,
		config = function()
			local lspconfig = require("lspconfig")

			-- Lua Language Server
			vim.defer_fn(function()
				lspconfig.lua_ls.setup({
					cmd = { "C:/Users/dqure/AppData/Local/nvim-data/mason/bin/lua-language-server.cmd" }, -- Explicit path for Windows
					flags = {
						debounce_text_changes = 150, -- Prevents crashes due to rapid changes
					},
					on_attach = function(client, bufnr)
						-- Keybindings (Only load once LSP is fully ready)
						vim.defer_fn(function()
							vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
							vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
							vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
						end, 500) -- Delay keybindings by 500ms
					end,
				})
			end, 1000) -- Delay LSP setup by 1s to avoid race conditions

			-- Python LSP (Pyright)
			lspconfig.pyright.setup({
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoImportCompletions = true,
						},
					},
				},
			})

			-- ✅ TypeScript LSP (Corrected to ts_ls)
			lspconfig.ts_ls.setup({})

			-- Java LSP (jdtls)
			lspconfig.jdtls.setup({
				cmd = { "jdtls" },
				root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git"),
			})

			-- C++ LSP (clangd)
			lspconfig.clangd.setup({})

			-- Autoformatter (Black for Python)
			require("conform").setup({
				formatters_by_ft = {
					python = { "black" },
				},
				format_on_save = true,
			})
		end,
	},
}
