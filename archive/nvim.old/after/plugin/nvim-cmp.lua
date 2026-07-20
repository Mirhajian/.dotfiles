local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp', priority = 1000 },   -- حتماً اولویت بالا داشته باشه
    { name = 'buffer' },
    { name = 'path' },
    -- { name = 'luasnip' } اگر snippet داری
  },
  mapping = cmp.mapping.preset.insert({
    -- Confirm completion with Enter
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- Navigate completion menu
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    -- Scroll documentation
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- Trigger completion manually
    ['<C-Space>'] = cmp.mapping.complete(),
    -- Abort completion
    ['<C-e>'] = cmp.mapping.abort(),
  }),
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged },  -- اتوماتیک بعد از تایپ
  },
})
