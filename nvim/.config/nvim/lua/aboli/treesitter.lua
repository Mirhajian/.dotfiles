-- توجه: این نسخه‌ی جدید nvim-treesitter (شاخه‌ی main) کاملاً بازنویسی شده و
-- API قدیمیِ require('nvim-treesitter.configs').setup{} رو دیگه نداره.
-- به جاش: نصب پارسرها با .install()، و فعال‌سازی های‌لایت با API نیتیو خود نویم.

local ensure_installed = {
    "lua", "python", "javascript", "typescript", "tsx",
    "bash", "markdown", "markdown_inline", "json", "yaml",
    "html", "css", "vim", "vimdoc", "query",
}

require("nvim-treesitter").install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
    pattern = ensure_installed,
    callback = function()
        vim.treesitter.start()
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
})
