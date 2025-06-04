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
				vtsls = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
				svelte = { "svelte" },
				lua_ls = { "lua" },
				clangd = { "c", "cpp", "objc", "objcpp" },
				arduino_language_server = { "arduino" },
			}

			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			for server, file_types in pairs(lazy_setup) do
				local opts = { capabilities = capabilities, filetypes = file_types }

				if server == "clangd" then
					opts.cmd = { "clangd", "--compile-commands-dir=." }
				end

				if server == "arduino_language_server" then
					opts.cmd = {
						"arduino-language-server",
						"-cli-config",
						"C:/Users/MAIN/AppData/Local/Arduino15/arduino-cli.yaml",
						"-cli",
						"C:/ProgramData/chocolatey/bin/arduino-cli.exe",
						"-fqbn",
						"arduino:avr:uno",
					}
				end

				if server == "vtsls" then
					opts.settings = {
						typescript = {
							inlayHints = {
								enabled = true,
							},
							referencesCodeLens = {
								enabled = true,
							},
						},
						experimental = {
							documentHighlight = true,
						},
					}
				end
				lspconfig[server].setup(opts)
			end
		end,
	},
}
