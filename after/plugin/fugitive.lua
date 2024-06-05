vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
local GDivino_Fugitive = vim.api.nvim_create_augroup("GDivino_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = GDivino_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>gp", function()
            vim.notify("push in progress...")
            vim.defer_fn(function()
                vim.cmd.Git("push")
                vim.notify("push executed")
            end, 550)
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>gP", function()
            vim.notify("pull in progress...")
            vim.defer_fn(function()
                vim.cmd.Git("pull")
                vim.notify("pull executed")
            end, 550)
        end, opts)

        vim.keymap.set("n", "<leader>gf", function()
            vim.notify("fetch in progress...", vim.log.levels.INFO)
            vim.defer_fn(function()
                vim.cmd.Git("fetch")
                vim.notify("fetch executed")
            end, 550)
        end, opts)

        vim.keymap.set("n", "<leader>gm", function()
            vim.notify("merge in progress...")
            vim.defer_fn(function()
                vim.cmd.Git("merge")
                vim.notify("merge executed")
            end, 550)
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>go", ":Git push -u origin ", opts)
        vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", opts)
        vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", opts)
        vim.keymap.set("n", "<leader>gb", ":Git stash list<CR>", opts)
        vim.keymap.set("n", "<leader>gB", ":Git stash pop ", opts)
    end,
})
