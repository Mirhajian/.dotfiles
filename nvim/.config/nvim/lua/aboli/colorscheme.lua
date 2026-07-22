require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    integrations = {
        telescope = true,
        treesitter = true,
        native_lsp = { enabled = true },
    },
})
vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin")
