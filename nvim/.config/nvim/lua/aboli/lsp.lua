-- از Neovim 0.11+ به بعد، دیگه نیازی به پلاگین nvim-lspconfig نیست.
-- خود Neovim دو تا API نیتیو داره: vim.lsp.config برای تعریف یه سرور،
-- و vim.lsp.enable برای فعال کردنش. mason فقط باینری‌ها رو نصب می‌کنه.
--
-- بعد از باز کردن نویم، دستور :Mason رو بزن و این‌ها رو نصب کن:
--   lua-language-server, pyright, typescript-language-server

require("mason").setup()

vim.lsp.config["lua_ls"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
        },
    },
}

vim.lsp.config["pyright"] = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
}

vim.lsp.config["ts_ls"] = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
    root_markers = { "package.json", "tsconfig.json", ".git" },
}

vim.lsp.enable({ "lua_ls", "pyright", "ts_ls" })

-- کلیدهای مخصوص LSP فقط وقتی رو یه بافر فعال می‌شن که واقعاً یه سرور
-- بهش وصل شده باشه (نه به‌صورت global برای همه‌ی فایل‌ها)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    signs = true,
    severity_sort = true,
})
