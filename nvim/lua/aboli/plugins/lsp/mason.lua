-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"golangci_lint_ls", -- golang lsp
		"snyk_ls",
		"typos_lsp",
		"angularls",
		"arduino_language_server",
		-- "asm_lsp",
		"bashls",
		-- "pkgbuild_language_server",
		"clangd",
		-- "csharp_ls",
		"omnisharp_mono",
		"omnisharp",
		"cmake",
		-- "neocmake",
		"cobol_ls",
		"fortls",
		"tsserver",
		"html",
		"cssls",
		"cssmodules_ls",
		"css_variables",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		-- "gopls",
		"jsonls",
		"biome",
		"jdtls",
		"quick_lint_js",
		"tsserver",
		"vtsls",
		"matlab_ls",
		-- "nginx_language_server",
		"intelephense",
		-- "phpactor",
		-- "psalm",
		"powershell_es",
		"basedpyright",
		-- "jedi_language_server",
		-- "pyre",
		-- "pyright",
		-- "pylyzer",
		"sourcery",
		-- "pylsp",
		-- "ruff",
		-- "ruff_lsp",
		-- "r_language_server",
		-- "ruby_lsp",
		-- "solargraph",
		-- "sorbet",
		-- "standardrb",
		-- "rubocop",
		"rust_analyzer",
		-- "sqlls",
		-- "sqls",
		"tsserver",
		"vtsls",
		"lemminx",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		-- "golangci_lint", -- go linter
		"cppcheck",
		"cpplint",
		"yapf",
		"semgrep",
		"astyle",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
