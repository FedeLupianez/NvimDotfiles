return {
	"anurag3301/nvim-platformio.lua",
	dependencies = {
		{ "akinsho/toggleterm.nvim" },
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		require("platformio").setup({
			lsp = "clangd", --default: ccls, other option: clangd
			-- If you pick clangd, it also creates compile_commands.json
		})
	end,
	enabled = true,
}
