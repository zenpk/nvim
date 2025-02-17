MiniDeps.add({
    source = "folke/flash.nvim",
    checkout = "main",
})

require('flash').setup({
    labels = "asdfghjklqwertyuiopzxcvbnm",
    modes = {
        search = {
            enabled = true,
        },
        -- options used when flash is activated through
        -- `f`, `F`, `t`, `T`, `;` and `,` motions
        char = {
            enabled = true,
            keys = { "f", "F", "t", "T", ";", "," },
        },
    },
})

vim.keymap.set({ "n", "x", "o" }, "s", function()
    require("flash").jump({
        pattern = ".", -- initialize pattern with any char
        search = {
            mode = function(pattern)
                -- remove leading dot
                if pattern:sub(1, 1) == "." then
                    pattern = pattern:sub(2)
                end
                -- return word pattern and proper skip pattern
                return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
            end,
            forward = true,
            wrap = false,
            multi_window = false,
        },
    })
end, { noremap = true })

vim.keymap.set({ "n", "x", "o" }, "S", function()
    require("flash").jump({
        pattern = ".", -- initialize pattern with any char
        search = {
            mode = function(pattern)
                -- remove leading dot
                if pattern:sub(1, 1) == "." then
                    pattern = pattern:sub(2)
                end
                -- return word pattern and proper skip pattern
                return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
            end,
            forward = false,
            wrap = false,
            multi_window = false,
        },
    })
end, { noremap = true })
