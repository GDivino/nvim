vim.keymap.set("n", "<leader>tp", function()
    vim.opt.splitright = false
    vim.treesitter.inspect_tree()
end)
