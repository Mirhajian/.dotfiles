local map = vim.keymap.set

-- باز کردن file explorer داخلی (netrw)
map("n", "<leader>pv", vim.cmd.Ex, { desc = "باز کردن file explorer" })

-- جابه‌جا کردن خط/بلاک انتخاب‌شده به بالا و پایین (حالت Visual)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- کرسر رو وسط صفحه نگه می‌داره موقع اسکرول و جستجو، تا گم نشی
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- paste کردن رو یه انتخاب، بدون این‌که چیزی که قبلاً کپی کرده بودی از دست بره
map("x", "<leader>p", [["_dP]])

-- کپی/حذف مستقیم با کلیپ‌بورد سیستم
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- حذف بدون این‌که register اصلی رو خراب کنه
map({ "n", "v" }, "<leader>d", [["_d]])

map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>")

-- رفتن بین آیتم‌های quickfix list
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")

-- جایگزینی سریع کلمه‌ی زیر کرسر تو کل فایل
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "جایگزینی کلمه‌ی زیر کرسر در کل فایل" })

-- اجرایی کردن فایل فعلی (chmod +x)
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- source کردن مجدد فایل فعلی (برای تست سریع تغییرات کانفیگ)
map("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "source کردن فایل فعلی" })
