-- sane clipboard
vim.keymap.set('', 'c', '"1c', { desc = 'throw into the void', noremap = true, silent = true })
vim.keymap.set('', 'C', '"1C', { noremap = true, silent = true })
vim.keymap.set('', 's', '"1s', { noremap = true, silent = true })
vim.keymap.set('', 'S', '"1S', { noremap = true, silent = true })
vim.keymap.set('', 'x', '"1x', { noremap = true, silent = true })
vim.keymap.set('', 'X', 'x', { desc = 'use X to cut', noremap = true, silent = true })
vim.keymap.set('', 'd', '"1d', { noremap = true, silent = true })
vim.keymap.set('', 'dd', '"1dd', { noremap = true, silent = true })
vim.keymap.set('', 'D', '"1D', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d', 'dd', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>D', 'D', { noremap = true, silent = true })

vim.keymap.set('n', 'U', '<C-r>', { desc = 'redo' })
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>v', '<C-v>', { desc = 'visual block' })
vim.keymap.set('n', '<leader>sw', ':w !sudo tee > /dev/null %<cr>', { desc = '[S]udo [W]rite' })
vim.keymap.set('n', '<leader>sp', ':set paste<cr>', { desc = '[S]et [P]aste' })
vim.keymap.set('n', '<leader>copy', ':set nonumber norelativenumber signcolumn=no wrap<cr>')

-- format code
vim.keymap.set('', '<leader>f', function()
  require('conform').format { async = true, lsp_fallback = true }
end)

-- useful for debugging
local function GeneratePrint()
  -- get the current buffer's filetype
  local filetype = vim.bo.filetype
  local printCmd = 'o'
  if filetype == 'python' or filetype == 'lua' then
    printCmd = printCmd .. 'print()'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(printCmd .. '<Esc>i', true, false, true), 'n', false)
  elseif
    filetype == 'javascript'
    or filetype == 'typescript'
    or filetype == 'javascriptreact'
    or filetype == 'typescriptreact'
    or filetype == 'vue'
    or filetype == 'svelte'
  then
    printCmd = printCmd .. 'console.log();'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(printCmd .. '<Esc>hi', true, false, true), 'n', false)
  elseif filetype == 'go' then
    printCmd = printCmd .. 'fmt.Println()'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(printCmd .. '<Esc>i', true, false, true), 'n', false)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('o<Esc>', true, false, true), 'n', false)
  end
end

vim.keymap.set('n', '<leader>gp', GeneratePrint, { desc = '[G]enerate [P]rint', noremap = true, silent = true })

local function GenerateLine()
  local filetype = vim.bo.filetype
  local message = '==========  =========='
  local moveCursor = '<Esc>bhi'
  local printCmd = 'o'
  if filetype == 'python' or filetype == 'lua' then
    printCmd = printCmd .. string.format("print('%s')", message)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(printCmd .. moveCursor, true, false, true), 'n', false)
  elseif
    filetype == 'javascript'
    or filetype == 'typescript'
    or filetype == 'javascriptreact'
    or filetype == 'typescriptreact'
    or filetype == 'vue'
    or filetype == 'svelte'
  then
    printCmd = printCmd .. string.format('console.log(`%s`);', message)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(printCmd .. moveCursor, true, false, true), 'n', false)
  elseif filetype == 'go' then
    printCmd = printCmd .. string.format('fmt.Println("%s")', message)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(printCmd .. moveCursor, true, false, true), 'n', false)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('o<Esc>', true, false, true), 'n', false)
  end
end

vim.keymap.set('n', '<leader>gl', GenerateLine, { desc = '[G]enerate [L]ine', noremap = true, silent = true })

-- useful for error handling
local function GenerateErr()
  local filetype = vim.bo.filetype
  local errBlock = 'o'
  if
    filetype == 'javascript'
    or filetype == 'typescript'
    or filetype == 'javascriptreact'
    or filetype == 'typescriptreact'
    or filetype == 'vue'
    or filetype == 'svelte'
  then
    errBlock = errBlock .. 'try {<CR><Esc>dda catch (e) {<CR><Esc>kko'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(errBlock, true, true, true), 't', false)
  elseif filetype == 'go' then
    errBlock = errBlock .. 'if err != nil {<CR>return err<Esc>k$o'
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(errBlock, true, true, true), 't', false)
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('o<Esc>', true, false, true), 'n', false)
  end
end

vim.keymap.set('n', '<leader>ge', GenerateErr, { desc = '[G]enerae [E]rror', noremap = true, silent = true })
