vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
local GDivino_Fugitive = vim.api.nvim_create_augroup("GDivino_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd

local function handleGitCommand(mode, shortcut, command, opts)
    vim.keymap.set(mode, shortcut, function()
        vim.notify("git " .. command .. " in progress...")
        vim.defer_fn(function()
            local success, result = pcall(vim.cmd.Git, command)
            if not success then
                vim.notify("git " .. command .. " failed: " .. result)
            else
                vim.notify("git " .. command .. " executed")
            end
        end, 550)
    end, opts)
end

autocmd("BufWinEnter", {
    group = GDivino_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        handleGitCommand("n", "<leader>gp", "push", opts)
        handleGitCommand("n", "<leader>gP", "pull", opts)
        handleGitCommand("n", "<leader>gf", "fetch", opts)
        handleGitCommand("n", "<leader>gm", "merge", opts)
        handleGitCommand("n", "<leader>gsl", "stash list", opts)

        -- vim.keymap.set("n", "<leader>go", ":Git push -u origin ", opts)
        -- vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", opts)
        -- vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", opts)
        -- vim.keymap.set("n", "<leader>gb", ":Git stash list<CR>", opts)
        vim.keymap.set("n", "<leader>go", ":Git push -u origin ", opts)
        vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<CR>", opts)
        vim.keymap.set("n", "<leader>gc", "<cmd>Git commit <CR>", opts)
        vim.keymap.set("n", "<leader>gsp", ":Git stash push ", opts)
        vim.keymap.set("n", "<leader>gsd", ":Git stash drop stash@{", opts)
        vim.keymap.set("n", "<leader>gsP", ":Git stash pop stash@{", opts)
        vim.keymap.set("n", "<leader>gB", "<cmd>Git log --oneline --graph --decorate --all<CR>", opts)
        vim.keymap.set("n", "<leader>gb", "<cmd>Git log --oneline --graph --decorate<CR>", opts)
    end,
})
