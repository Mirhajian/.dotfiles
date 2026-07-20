vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.mm",
  command = "set filetype=objcpp",
})
