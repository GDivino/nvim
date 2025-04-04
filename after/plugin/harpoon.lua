-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
local harpoon = require("harpoon")
-- local ui = require("harpoon.ui")
harpoon:setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true
    }
})

vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
