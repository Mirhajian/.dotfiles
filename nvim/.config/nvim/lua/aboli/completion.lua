-- blink.cmp: جانشین سریع‌تر و ساده‌تر nvim-cmp (خودِ LazyVim و kickstart.nvim
-- هم به همین سوییچ کردن)

require("blink.cmp").setup({
    keymap = { preset = "default" }, -- Ctrl+y برای accept, Ctrl+n/p برای حرکت
    appearance = {
        nerd_font_variant = "mono",
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    signature = { enabled = true },
})
