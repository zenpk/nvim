MiniDeps.add({
    source = "folke/snacks.nvim",
    checkout = "main"
})
require("snacks").setup({
    explorer = {
        replace_newtr = true,
    },
})
