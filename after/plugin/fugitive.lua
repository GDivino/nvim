vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
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
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "<leader>gp", function()
      vim.cmd.Git('push')
    end, opts)

    -- rebase always
    vim.keymap.set("n", "<leader>GP", function()
      vim.cmd.Git('pull')
    end, opts)

    -- NOTE: It allows me to easily set the branch i am pushing and any tracking
    -- needed if i did not set the branch up correctly
    vim.keymap.set("n", "<leader>go", ":Git push -u origin ", opts)
    vim.keymap.set("n", "<leader>gc", ":Git commit", opts)
    vim.keymap.set("n", "<leader>ga", function()
      vim.cmd.Git({'add', '.'})
    end, opts)
  end,
})
