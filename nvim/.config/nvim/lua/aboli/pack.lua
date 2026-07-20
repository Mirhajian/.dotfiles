-- vim.pack: پلاگین منیجر NATIVE خود Neovim (از نسخه‌ی 0.12 به بعد)
-- دیگه نیازی به packer/lazy نیست، مگر این‌که lazy-loading پیچیده بخوای.
--
-- دستورات مفید:
--   :lua vim.pack.update()          آپدیت همه‌ی پلاگین‌ها
--   :lua vim.pack.update({'name'})  آپدیت یه پلاگین خاص
--   :lua vim.pack.del({'name'})     حذف یه پلاگین
--   :h vim.pack                     مستندات کامل

vim.pack.add({
    -- تم رنگی
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },

    -- Treesitter: های‌لایت و indent بر اساس درک واقعی از syntax،
    -- نه صرفاً regex. باید رو شاخه‌ی "main" باشه (نسخه‌ی جدید و بازنویسی‌شده).
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

    -- Fuzzy finder برای فایل‌ها، متن، بافرها و غیره
    "https://github.com/nvim-lua/plenary.nvim",
    { src = "https://github.com/nvim-telescope/telescope.nvim", version = "0.1.x" },

    -- Mason: نصب خودکار باینری‌های LSP server / formatter
    -- (خود اتصال LSP رو با API نیتیو نویم انجام می‌دیم، نه lspconfig)
    "https://github.com/williamboman/mason.nvim",

    -- Completion؛ جانشین مدرن و سریع‌تر nvim-cmp
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
    "https://github.com/rafamadriz/friendly-snippets",

    -- فرمت کردن کد؛ جانشین یکپارچه‌ی null-ls/none-ls
    "https://github.com/stevearc/conform.nvim",

    -- ابزارهایی که تو کانفیگ قبلیت داشتی و نگه‌شون داشتیم
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
    "https://github.com/mbbill/undotree",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/christoomey/vim-tmux-navigator",

    -- بستن خودکار پرانتز/کوتیشن
    "https://github.com/windwp/nvim-autopairs",

    { src = vim.fn.expand("~/projects/netria") },

    "https://github.com/iamcco/markdown-preview.nvim",

    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/VonHeikemen/fine-cmdline.nvim",

    "https://github.com/prichrd/netrw.nvim",

})
