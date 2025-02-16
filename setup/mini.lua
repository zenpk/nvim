-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Safely execute immediately
now(function()
  add({
    source = 'doums/dark.nvim'
  })

  add({
    source = 'nickkadutskyi/jb.nvim'
  })
end)
now(function()
  vim.o.termguicolors = true
  vim.cmd('colorscheme dark')
end)

now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
end)

now(function() require('mini.icons').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.git').setup() end)

-- Safely execute later
later(function() require('mini.ai').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.pick').setup() end)
later(function() require('mini.surround').setup() end)

-- Other plugins

now(function()
  require('plugins.lsp')
  require('plugins.snacks')
end)

later(function()
  require('plugins.flash')
end)
