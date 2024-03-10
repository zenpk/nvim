-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    -- file tree
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {
              'node_modules',
            },
            hide_by_pattern = { -- uses glob style patterns
              --"*.meta",
              --"*/src/*/tsconfig.json",
            },
            always_show = { -- remains visible even if other settings would normally hide it
              --".gitignored",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
              --".DS_Store",
              --"thumbs.db"
            },
            never_show_by_pattern = { -- uses glob style patterns
              --".null-ls_*",
            },
          },
          commands = {
            -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/202
            -- over write default 'delete' command to 'trash'.
            delete = function(state)
              local inputs = require 'neo-tree.ui.inputs'
              local path = state.tree:get_node().path
              local msg = 'Are you sure you want to trash ' .. path
              inputs.confirm(msg, function(confirmed)
                if not confirmed then
                  return
                end

                vim.fn.system { 'trash', vim.fn.fnameescape(path) }
                require('neo-tree.sources.manager').refresh(state.name)
              end)
            end,

            -- over write default 'delete_visual' command to 'trash' x n.
            delete_visual = function(state, selected_nodes)
              local inputs = require 'neo-tree.ui.inputs'

              -- get table items count
              function GetTableLen(tbl)
                local len = 0
                for n in pairs(tbl) do
                  len = len + 1
                end
                return len
              end

              local count = GetTableLen(selected_nodes)
              local msg = 'Are you sure you want to trash ' .. count .. ' files ?'
              inputs.confirm(msg, function(confirmed)
                if not confirmed then
                  return
                end
                for _, node in ipairs(selected_nodes) do
                  vim.fn.system { 'trash', vim.fn.fnameescape(node.path) }
                end
                require('neo-tree.sources.manager').refresh(state.name)
              end)
            end,
          },
        },
      }
    end,
  },
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
  {
    -- colorscheme
    'zenpk/jeteyes',
    lazy = false,
    priority = 1000,
    name = 'jeteyes',
    config = function()
      vim.cmd.colorscheme 'jeteyes'
    end,
  },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'rktjmp/lush.nvim',
  },
  { 'rktjmp/shipwright.nvim' },
}
