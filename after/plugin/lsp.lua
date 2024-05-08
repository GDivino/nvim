-- ========== LSP zero ==========
local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")
lsp_zero.setup()

require("lspconfig").lua_ls.setup(lsp_zero.nvim_lua_ls())
require("lspconfig").tsserver.setup({})
require("lspconfig").bashls.setup({})
require("lspconfig").terraformls.setup({})
require("lspconfig").eslint.setup({})

-- ========== LSP Mason ==========
require("mason").setup({})
require("mason-lspconfig").setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        "eslint",
        "tsserver",
        "rust_analyzer",
        "terraformls",
        "bashls",
        "lua_ls",
    },

    handlers = {
        lsp_zero.default_setup,
    },
})

lsp_zero.set_preferences({
    sign_icons = {}
})

-- ========== CMP ==========
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })
})

local GDivino_lsp = vim.api.nvim_create_augroup("GDivino_lsp", {})
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = GDivino_lsp,
    pattern = "*",

    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "<leader>lv", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    end
})

