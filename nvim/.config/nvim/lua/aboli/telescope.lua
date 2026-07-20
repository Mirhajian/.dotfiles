require("telescope").setup({})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "پیدا کردن فایل" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "فایل‌های git" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "لیست بافرهای باز" })
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "جستجوی متن تو کل پروژه" })
