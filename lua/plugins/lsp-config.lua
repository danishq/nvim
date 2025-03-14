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
				ensure_installed = { "lua_ls", "pyright", "ts_ls", "jdtls", "clangd" },
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

			-- Detect OS
			local is_windows = vim.fn.has("win32") == 1

			-- Global `on_attach` function
			local on_attach = function(client, bufnr)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
			end

			-- Lua Language Server (Cross-Platform)
			vim.defer_fn(function()
				lspconfig.lua_ls.setup({
					cmd = is_windows and { "C:/Users/dqure/AppData/Local/nvim-data/mason/bin/lua-language-server.cmd" }
						or { "lua-language-server" }, -- Default for Ubuntu
					flags = { debounce_text_changes = 150 },
					on_attach = on_attach,
				})
			end, 1000)

			-- Python LSP (Pyright)
			lspconfig.pyright.setup({
				on_attach = on_attach,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoImportCompletions = true,
						},
					},
				},
			})

			-- TypeScript LSP
			lspconfig.ts_ls.setup({ on_attach = on_attach })

			-- Java LSP (jdtls)
			local jdtls_cmd = is_windows and { "jdtls.cmd" } or { "jdtls" }
			lspconfig.jdtls.setup({
				on_attach = on_attach,
				cmd = jdtls_cmd,
				root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git"),
			})

			-- C++ LSP (clangd)
			lspconfig.clangd.setup({ on_attach = on_attach })

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
