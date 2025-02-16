return {
  {
    -- git diff
    'sindrets/diffview.nvim',
  },
  {
    -- auto brackets
    'windwp/nvim-autopairs',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {
    scope = { enabled = false },
  } },
  {
    'rktjmp/lush.nvim',
  },
  { 'rktjmp/shipwright.nvim' },
}
