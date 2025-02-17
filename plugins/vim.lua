local add = MiniDeps.add

add({
    source = "tpope/vim-surround",
    checkout = "master",
})

add({
    source = "bkad/CamelCaseMotion",
    checkout = "master",
})
vim.keymap.set({ "n", "x", "o" }, "<leader>w", "<Plug>CamelCaseMotion_w")
vim.keymap.set({ "n", "x", "o" }, "<leader>b", "<Plug>CamelCaseMotion_b")
vim.keymap.set({ "n", "x", "o" }, "<leader>e", "<Plug>CamelCaseMotion_e")
