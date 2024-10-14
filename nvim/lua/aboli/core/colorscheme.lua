-- local status _ = pcall(vim.cmd, "colorscheme github_dark_dimmed")
-- local status _ = pcall(vim.cmd, "colorscheme github_dark_high_contrast")
-- local status _ = pcall(vim.cmd, "colorscheme github_dark_colorblind")
-- local status _ = pcall(vim.cmd, "colorscheme github_dark_tritanopia")
-- local status _ = pcall(vim.cmd, "colorscheme github_dark_default")
-- local status _ = pcall(vim.cmd, "colorscheme vscode_modern")
vim.g.nightflyTransparent = true
local status, err = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Error setting colorscheme:", err)
	return
end
