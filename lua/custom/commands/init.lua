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

-- -- automatically focus on the right side when boot up (useful because the left side is Neotree)
-- vim.api.nvim_create_autocmd('VimEnter', {
--   callback = function()
--     -- Count the number of windows in the current tab.
--     local windows = vim.api.nvim_tabpage_list_wins(0)
--     if #windows == 2 then
--       -- Store the current window ID.
--       local current_win = vim.api.nvim_get_current_win()
--       -- Get window positions. In a vertical split, the window with the smaller 'col' value is on the left.
--       local win1_col = vim.api.nvim_win_get_position(windows[1])[2]
--       local win2_col = vim.api.nvim_win_get_position(windows[2])[2]
--       -- Check if windows are vertically split by comparing their column positions.
--       -- A difference in 'col' values indicates a vertical split.
--       if win1_col ~= win2_col then
--         if current_win == windows[1] then
--           -- Focus right window if currently focused on the left window.
--           vim.api.nvim_set_current_win(windows[2])
--         end
--       end
--     end
--   end,
-- })
