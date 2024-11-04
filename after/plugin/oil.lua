vim.opt.splitright = true
local oil = require("oil")

oil.setup({
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

local GDivino_oil = vim.api.nvim_create_augroup("GDivino_oil", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinEnter", {
    group = GDivino_oil,
    pattern = "*",
    callback = function()
        if vim.bo.filetype ~= "oil" then
            vim.keymap.set("n", "<leader>dd", function() vim.cmd("echo @ | echon expand('%:p')") end)
            vim.keymap.set("n", "<leader>dy", ":redir @* | echon expand('%:p') | redir END<CR>")
            return
        end

        vim.keymap.set("n", "<leader>dd", function()
            local dir = oil.get_current_dir()
            print(dir)
        end)
        vim.keymap.set("n", "<leader>dy", function()
            local dir = oil.get_current_dir()
            print(dir)
            vim.fn.setreg("+", dir)
        end)
    end
})
