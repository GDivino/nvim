require("oil").setup({
    keymaps = {
        ["<CR>"] = "actions.select",
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
    },
})
