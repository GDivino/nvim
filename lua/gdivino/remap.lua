vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- vim.keymap.set({ "n", "v" }, "<leader>c", [["_c]])

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-[>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-]>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>r", [[:%s/]])
-- vim.keymap.set("n", "<leader>l", "/")
vim.keymap.set("v", "<leader>su", ":sort u<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<C-p>", function()
    vim.cmd("bprevious")
end)
vim.keymap.set("n", "<C-n>", function()
    vim.cmd("bnext")
end)

vim.keymap.set("n", "<leader>dd", function() vim.cmd("echo @%") end)
vim.keymap.set("n", "<leader>dy", ":redir @* | echon expand('%:p') | redir END<CR>")

-- vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
-- vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")

vim.keymap.set("n", "<leader>wh", "<cmd>hor split<CR>")
vim.keymap.set("n", "<leader>wv", "<cmd>vert split<CR>")

--  vim.keymap.set("n", "<leader>wq", "ciw\"<C-r>\"\"<esc>")
--  vim.keymap.set("n", "<leader>wu", "di\"hPl2x")
