return {
    { -- Autoformat
        'stevearc/conform.nvim',
        opts = {
            notify_on_error = true,
            -- format_on_save = {
            --   timeout_ms = 500,
            --   lsp_fallback = true,
            -- },
            formatters_by_ft = {
                lua = { 'stylua' },
                -- Conform can also run multiple formatters sequentially
                -- You can use a sub-list to tell conform to run *until* a formatter
                -- is found.
                go = { { 'goimport', 'gofmt' } },
                html = { { 'prettierd', 'prettier' } },
                javascript = { { 'prettierd', 'prettier' } },
                javascriptreact = { { 'prettierd', 'prettier' } },
                python = { 'isort', 'black' },
                typescript = { { 'prettierd', 'prettier' } },
                typescriptreact = { { 'prettierd', 'prettier' } },
            },
        },
    },
}
