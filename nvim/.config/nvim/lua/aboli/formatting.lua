-- conform.nvim: فرمت کردن کد به‌صورت یکپارچه، مستقل از این‌که LSP خودش
-- فرمتر داره یا نه. فرمترها هم از طریق mason نصب می‌شن (:Mason).

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback", -- اگه فرمتر مخصوص نبود، از فرمت خود LSP استفاده کن
    },
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { desc = "فرمت کردن فایل فعلی" })
