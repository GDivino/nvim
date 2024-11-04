vim.opt.splitright = true

require("oil").setup({
    default_file_explorer = false,
    keymaps = {
        ["<CR>"] = "actions.select",
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["<C-r>"] = "actions.refresh",
        ["<C-p>"] = "actions.preview"
    },
    view_options = {
        show_hidden = true,
    }
})

