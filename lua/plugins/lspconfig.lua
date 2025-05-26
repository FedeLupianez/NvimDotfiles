return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			ensure_installed = {
				"vtsls",
				"pyright",
			},
		},

		config = function()
			local lazy_setup = {
				pyright = { "python" },
				vtsls = { "typescript", "javascript", "typescriptreact", "javascriptreact", "svelte" },
				svelte = { "svelte" },
				lua_ls = { "lua" },
				clangd = { "c", "cpp", "objc", "objcpp" },
			}

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			for server, file_types in ipairs(lazy_setup) do
				local opts = { capabilities = capabilities, filetypes = file_types }

				if server == "clangd" then
					opts.cmd = { "clangd", "--compile-commands-dir=." }
				end
				lspconfig[server].setup(opts)
			end
		end,
	},
}
