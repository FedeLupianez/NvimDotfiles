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
			local servers = {
				"vtsls",
				"pyright",
				-- "clangd",
				"lua_ls",
			}
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")
			-- configuracion de clangd para que detecte las rutas de librerias para arduino
			lspconfig.clangd.setup({ cmd = { "clangd", "--compile-commands-dir=." }, capabilities = capabilities })

			for _, server in ipairs(servers) do
				lspconfig[server].setup({ capabilities = capabilities })
			end
		end,
	},
}
