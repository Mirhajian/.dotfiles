local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})

  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
  vim.keymap.set({"n", "x"}, "<F3>", function() vim.lsp.buf.format({async = true}) end, opts)
  vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
end)

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'pyright',
    'tsserver',
    'rust_analyzer',
  },
  handlers = {
    lsp_zero.default_setup,

    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})

require('lspconfig').sourcekit.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach    = lsp_zero.on_attach,

  filetypes = {
    "swift",
    "objc",
    "objcpp",
    "objective-c",
    "objective-cpp",
    "c", "cpp"
  },

  root_dir = require('lspconfig.util').root_pattern(
    "buildServer.json",
    "build/",
    ".git",
    "compile_commands.json",
    "Package.swift",
    "*.xcodeproj",
    "*.xcworkspace"
  ),

}

lsp_zero.setup()

require('lspconfig').sourcekit.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),

  on_attach = lsp_zero.on_attach,

  filetypes = { "swift", "objc", "objcpp", "objective-c", "objective-cpp" },

  root_dir = require('lspconfig.util').root_pattern(
    "buildServer.json",
    "*.xcodeproj",
    "*.xcworkspace",
    "Package.swift",
    "compile_commands.json",
    ".git"
  ),

}
