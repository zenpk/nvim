-- sane clipboard
vim.keymap.set('n', 'c', '"1c', { desc = 'throw into the void', noremap = true, silent = true })
vim.keymap.set('n', 'C', '"1C', { noremap = true, silent = true })
vim.keymap.set('n', 's', '"1s', { noremap = true, silent = true })
vim.keymap.set('n', 'S', '"1S', { noremap = true, silent = true })
vim.keymap.set('n', 'x', '"1x', { noremap = true, silent = true })
vim.keymap.set('n', 'X', '"x', { desc = 'use X to cut', noremap = true, silent = true })
vim.keymap.set('n', 'd', '"1d', { noremap = true, silent = true })
vim.keymap.set('n', 'dd', '"1dd', { noremap = true, silent = true })
vim.keymap.set('n', 'D', '"1D', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d', 'dd', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>D', 'D', { noremap = true, silent = true })

vim.keymap.set('n', 'U', '<C-r>', { desc = 'redo' })
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>v', '<C-v>', { desc = 'visual block' })
vim.keymap.set('n', '<leader>sw', ':w !sudo tee > /dev/null %<cr>', { desc = 'sudo write' })
vim.keymap.set('n', '<leader>sp', ':set paste<cr>')
vim.keymap.set('n', '<leader>copy', ':set nonumber norelativenumber signcolumn=no wrap<cr>')

-- format code
vim.keymap.set('', '<leader>f', function()
  require('conform').format { async = true, lsp_fallback = true }
end)

-- useful for debugging
function GeneratePrint()
  -- get the current buffer's filetype
  local filetype = vim.bo.filetype
  if filetype == 'python' or 'lua' then
    return 'oprint()<left>'
  elseif filetype == 'javascript' or filetype == 'typescript' then
    return 'oconsole.log();<left><left>'
  elseif filetype == 'go' then
    return 'ofmt.Println()<left>'
  else
    return 'o'
  end
end

vim.keymap.set('n', '<leader>gp', GeneratePrint(), { desc = '[G]enerate [P]rint', noremap = true, silent = true })

function GenerateLine()
  local filetype = vim.bo.filetype
  local message = '========== DEBUG =========='
  if filetype == 'python' or 'lua' then
    return string.format("oprint('%s')<esc>", message)
  elseif filetype == 'javascript' or filetype == 'typescript' then
    return string.format('oconsole.log(`%s`);<esc>', message)
  elseif filetype == 'go' then
    return string.format('ofmt.Println("%s")<esc>', message)
  else
    return 'o'
  end
end

vim.keymap.set('n', '<leader>gl', GenerateLine(), { desc = '[G]enerate [L]ine', noremap = true, silent = true })

-- useful for error handling
function GeneralErr()
  local filetype = vim.bo.filetype
  if filetype == 'javascript' or filetype == 'typescript' then
    return 'otry {<enter>} catch (e) {<enter>}<esc>kk$o'
  elseif filetype == 'go' then
    return 'oif err != nil {<enter>return err<enter>}<enter><esc>'
  else
    return 'o'
  end
end

vim.keymap.set('n', '<leader>ge', GeneralErr(), { desc = '[G]enerae [E]rror', noremap = true, silent = true })
