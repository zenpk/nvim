vim.api.nvim_create_user_command('NT', 'Neotree', { desc = 'shorter [N]eo[T]ree command' })
vim.api.nvim_create_user_command('DVF', 'DiffviewFileHistory %', { desc = 'git [D]iff [V]iew for current [F]ile' })
vim.api.nvim_create_user_command('DVB', 'DiffviewFileHistory', { desc = 'git [D]iff [V]iew for current [B]ranch' })

-- auto save
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost' }, {
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand '%' ~= '' and vim.bo.buftype == '' then
      vim.api.nvim_command 'silent update'
    end
  end,
})
