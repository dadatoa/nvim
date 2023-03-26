vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Formatting", { clear = true }),
  command = ":Format"
})
