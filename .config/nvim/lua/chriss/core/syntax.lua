-- Define the autocommands
vim.cmd("autocmd BufNewFile,BufRead *.ycql,*.lib,*.func :set filetype=sql")
print("Lua syntax configuration loaded")
