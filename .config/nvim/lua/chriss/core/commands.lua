-- Define the autocommands
vim.cmd("autocmd BufNewFile,BufRead *.ycql,*.lib,*.func :set filetype=sql")
vim.cmd("set foldmethod=indent")
vim.cmd("set foldlevel=10")
-- vim.cmd("set foldclose=all")
