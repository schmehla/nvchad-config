-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.g.pyindent_open_paren = 0
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
