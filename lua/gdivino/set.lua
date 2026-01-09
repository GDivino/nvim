-- vim.opt.guicursor = "i:block"
vim.opt.guicursor = "a:blinkon100"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.breakindent = false
vim.opt.showbreak = ""
vim.keymap.set("n", "<leader>w", function()
    vim.opt.wrap = not vim.opt.wrap:get()
    vim.opt.linebreak = not vim.opt.linebreak:get()
    vim.opt.breakindent = not vim.opt.breakindent:get()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()

    local wrap_enabled = vim.opt.wrap:get()

    if wrap_enabled then
        vim.keymap.set('n', 'j', 'gj')
        vim.keymap.set('n', 'k', 'gk')
        vim.keymap.set('n', '<Down>', 'gj')
        vim.keymap.set('n', '<Up>', 'gk')
        vim.keymap.set('n', '0', 'g0')
        vim.keymap.set('n', '$', 'g$')
        vim.keymap.set('n', '_', 'g^')
        vim.keymap.set('n', '<S-a>', function()
            vim.api.nvim_feedkeys('g$a', 'n', false)
        end)
        vim.opt.showbreak = "↳ "
    else
        vim.keymap.set('n', 'j', 'j')
        vim.keymap.set('n', 'k', 'k')
        vim.keymap.set('n', '<Down>', '<Down>')
        vim.keymap.set('n', '<Up>', '<Up>')
        vim.keymap.set('n', '0', '0')
        vim.keymap.set('n', '$', '$')
        vim.keymap.set('n', '_', '_')
        vim.keymap.set('n', '<S-a>', 'A')
        vim.opt.showbreak = ""
    end
end)

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.inccommand = "split"

vim.lsp.set_log_level("off")
