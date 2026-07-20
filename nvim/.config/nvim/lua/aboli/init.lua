-- ترتیب مهمه:
-- ۱. options/keymaps پایه (سریع، بدون وابستگی به پلاگین)
-- ۲. pack -> نصب/فعال کردن پلاگین‌ها با vim.pack
-- ۳. بعد از اون می‌تونیم require('اسم-پلاگین') کنیم چون رو runtimepath هستن

require("aboli.options")
require("aboli.keymaps")
require("aboli.pack")

require("aboli.colorscheme")
require("aboli.treesitter")
require("aboli.telescope")
require("aboli.harpoon")
require("aboli.lsp")
require("aboli.completion")
require("aboli.formatting")
require("aboli.autopairs")
