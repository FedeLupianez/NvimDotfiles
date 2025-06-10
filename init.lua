-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.tabstop = 2 -- Número de espacios que ocupa el tab
vim.opt.shiftwidth = 2 -- Tamaño de indentación
vim.opt.guicursor = ""

vim.opt.ttyfast = true -- Asume una terminal rapida
vim.opt.updatetime = 300 -- Reduce el tiempo de espera para eventos
vim.diagnostic.config({ virtual_text = true })

vim.o.shell = "pwsh.exe"
vim.o.shellcmdflag = "/c"
vim.o.shellquote = ""
vim.o.shellxquote = ""
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.ino",
	callback = function()
		vim.bo.filetype = "cpp"
	end,
})
