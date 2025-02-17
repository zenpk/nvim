local vscode = require('vscode')

vim.keymap.set("n", "gr", function()
    vscode.action("editor.action.goToReferences")
end, { noremap = true })

vim.keymap.set("n", "gi", function()
    vscode.action("editor.action.goToImplementation")
end, { noremap = true })

-- gd: go to definition (revealDefinition)
-- gf: go to declaration (revealDeclaration)

vim.keymap.set("n", "gt", function()
    vscode.action("editor.action.goToTypeDefinition")
end, { noremap = true })

vim.keymap.set("n", "<leader>f", function()
    vscode.action("editor.action.formatDocument")
end, { noremap = true })

vim.keymap.set("n", "<leader>rn", function()
    vscode.action("editor.action.rename")
end, { noremap = true })

vim.keymap.set("n", "<leader>qf", function()
    vscode.action("editor.action.quickFix")
end, { noremap = true })

vim.keymap.set("n", "<leader>oi", function()
    vscode.action("editor.action.organizeImports")
end, { noremap = true })

vim.keymap.set("n", "<leader>pc", function()
    vscode.action("editor.showCallHierarchy")
end, { noremap = true })

vim.keymap.set("n", "[d", function()
    vscode.action("editor.action.marker.prev")
end, { noremap = true })

vim.keymap.set("n", "]d", function()
    vscode.action("editor.action.marker.next")
end, { noremap = true })

vim.keymap.set("n", "<leader>gp", function()
    vscode.action("snippet-on-file-type.insertSnippetBasedOnFileType", { args = { "print" } })
end, { noremap = true })

vim.keymap.set("n", "<leader>gl", function()
    vscode.action("snippet-on-file-type.insertSnippetBasedOnFileType", { args = { "log" } })
end, { noremap = true })

vim.keymap.set("n", "<leader>ge", function()
    vscode.action("snippet-on-file-type.insertSnippetBasedOnFileType", { args = { "error" } })
end, { noremap = true })

vim.keymap.set("v", "<leader>f", function()
    vscode.action("editor.action.formatSelection")
end, { noremap = true })
