vim.api.nvim_create_user_command('NT', 'Neotree', { desc = 'shorter [N]eo[T]ree command' })
vim.api.nvim_create_user_command('DVF', 'DiffviewFilehistory %', { desc = 'git [D]iff [V]iew for current [F]ile' })
vim.api.nvim_create_user_command('DVB', 'DiffviewFilehistory', { desc = 'git [D]iff [V]iew for current [B]ranch' })
