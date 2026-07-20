-- Disable netrw's automatic directory handling
vim.g.netrw_keepdir = 1

require('netria').setup({
  -- Window appearance
  title = " Netria ",
  position = "center",        -- It could be "center", "left", "right"
  centered = true,
  width = 0.7,                -- Width as percentage of screen (0.0-1.0)
  height = 0.8,               -- Height as percentage of screen (0.0-1.0)
  
  -- Border options
  border = true,              -- Enable border around netrw
  border_style = "rounded",   -- Options: "none", "single", "double", "rounded", "solid", "shadow"
  
  -- Netrw settings
  hide_banner = true,         -- Hide the default netrw banner
  liststyle = 3,              -- Tree style listing
  winsize = 0,                -- Let our plugin handle sizing
  show_line_numbers = true,   -- Show line numbers
  show_relative_numbers = true, -- Show relative line numbers
  no_modify = true,           -- No modifications allowed in netrw buffer
  readonly = true,            -- Read-only mode
  no_wrap = true,             -- No text wrapping

  banner = {
    enabled = true,
    art = {
        "",
        "███╗   ██╗███████╗████████╗██████╗ ██╗ █████╗    ┌───────────────────────────────┐",
        "████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║██╔══██╗   │ Netria - A Nice Looking Netrw │",
        "██╔██╗ ██║█████╗     ██║   ██████╔╝██║███████║   │ Version: 1.0.0                │",
        "██║╚██╗██║██╔══╝     ██║   ██╔══██╗██║██╔══██║   │ :Netria - Open Explorer       │",
        "██║ ╚████║███████╗   ██║   ██║  ██║██║██║  ██║   │ :NetriaToggle - Toggle Nerria │",
        "╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝   └───────────────────────────────┘",
        ""
    },
  },
})

-- Set up a keymap to toggle the explorer
vim.keymap.set('n', '<leader>e', require('netria').toggle, { desc = "Toggle Netria" })
