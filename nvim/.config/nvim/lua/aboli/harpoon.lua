local harpoon = require("harpoon")
harpoon:setup()

-- اضافه کردن فایل فعلی به لیست harpoon
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "افزودن به Harpoon" })

-- باز کردن منوی سریع harpoon
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "منوی Harpoon" })

-- پرش سریع به فایل شماره‌ی ۱ تا ۴ (توجه: از leader استفاده شده تا با
-- کلیدهای C-h/j/k/l مخصوص vim-tmux-navigator تداخل نداشته باشه)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
