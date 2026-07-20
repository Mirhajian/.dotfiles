-- Markdown Preview: باید بعد از نصب اولیه یه مرحله‌ی build اجرا بشه.
-- چون vim.pack خودش build hook نداره، این کار رو با رویداد PackChanged انجام می‌دیم.
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "markdown-preview.nvim" and ev.data.kind == "install" then
            vim.fn["mkdp#util#install"]()
        end
    end,
})
-- Enterfoundim.g.mkdp_filetypes = { "markdown" }
vim.g.mkdp_filetypes = { "markdown" }

-- Fine-cmdline: کامندلاین شیک‌تر به‌جای نوار پایین معمولی

vim.api.nvim_set_hl(0, "FineCmdlineBorder", { fg = "#89b4fa" }) -- می‌تونی هر رنگی دلت خواست بذاری
require("fine-cmdline").setup({
    popup = {
        border = {
            style = "rounded",
        },
        win_options = {
            winhighlight = "Normal:Normal,FloatBorder:FineCmdlineBorder",
        },
    },
})
vim.keymap.set("n", ":", "<cmd>FineCmdline<CR>")

-- Netrw.nvim: آیکن و ظاهر بهتر برای file explorer پیش‌فرض
require("netrw").setup({})
