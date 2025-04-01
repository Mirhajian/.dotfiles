vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ' > '
  },
  popup = {
    position = {
      row = '30%',
      col = '50%',
    },
    size = {
      width = '60%',
    },
    border = {
      style = 'rounded',
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },
  hooks = {
    before_mount = function(input)
      -- code
    end,
    after_mount = function(input)
      -- code
    end,
    set_keymaps = function(imap, feedkeys)
      local fn = require('fine-cmdline').fn

      imap('<M-k>', fn.up_search_history)
      imap('<M-j>', fn.down_search_history)
      imap('<Up>', fn.up_history)
      imap('<Down>', fn.down_history)
    end
  }
})
