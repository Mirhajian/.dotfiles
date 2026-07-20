require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
        telescope = true,
        treesitter = true,
        native_lsp = { enabled = true },
    },
})

vim.cmd.colorscheme("catppuccin")
