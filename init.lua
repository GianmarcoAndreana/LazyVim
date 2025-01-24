-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("custom.ampl")

-- Turn on syntax highlighting for AMPL files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.ampl", "*.run", "*.mod", "*.dat" },
  command = "syntax on",
})
