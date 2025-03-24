-- ========== LSP zero ==========
local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")
lsp_zero.setup()


-- ========== lspconfig ==========
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())
lspconfig.ts_ls.setup({
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
})
lspconfig.bashls.setup({
    filetypes = { "sh" },
    settings = {
        bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command)"
        }
    },
    single_file_support = true
})
lspconfig.terraformls.setup({})
lspconfig.eslint.setup({
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" }
})
lspconfig.pylsp.setup({})
lspconfig.yamlls.setup({})
lspconfig.jsonls.setup({})
lspconfig.ruby_lsp.setup({
    cmd = { "ruby-lsp" },
    filetypes = { "ruby", "eruby" },
    init_options = {
        formatter = "standard",
        linters = { "standard" }
    },
})


-- ========== LSP Mason ==========
require("mason").setup({})
require("mason-lspconfig").setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        "eslint",
        "ts_ls",
        "pylsp",
        "rust_analyzer",
        "terraformls",
        "bashls",
        "lua_ls",
        "yamlls",
        "jsonls",
        "ruby_lsp",
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


-- ========== autocmd ==========
local GDivino_lsp = vim.api.nvim_create_augroup("GDivino_lsp", {})
local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = GDivino_lsp,
    pattern = "*",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "<leader>lv", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", opts)
    end,
})

autocmd("FileType", {
    pattern = { "ruby", "eruby" },
    group = GDivino_lsp,
    callback = function()
        vim.lsp.start {
            name = "standard",
            cmd = { "/opt/homebrew/lib/ruby/gems/3.4.0/bin/standardrb", "--lsp" }
        }
    end,
})

-- ========== terraform autocmd ==========
local GDivino_tf_lsp = vim.api.nvim_create_augroup("GDivino_tf_lsp", {})
-- autocmd({ "BufRead", "BufNewFile" }, {
--     group = GDivino_tf_lsp,
--     pattern = "*.tf",
--     command = "silent! autocmd! filetypedetect",
-- })

autocmd({ "BufRead", "BufNewFile" }, {
    group = GDivino_tf_lsp,
    pattern = "*.hcl",
    command = "set filetype=hcl",
})

autocmd({ "BufRead", "BufNewFile" }, {
    group = GDivino_tf_lsp,
    pattern = { ".terraformrc", "terraform.rc" },
    command = "set filetype=hcl",
})

autocmd({ "BufRead", "BufNewFile" }, {
    group = GDivino_tf_lsp,
    pattern = { "*.tf", "*.tfvars" },
    command = "set filetype=terraform",
})

autocmd({ "BufRead", "BufNewFile" }, {
    group = GDivino_tf_lsp,
    pattern = { "*.tfstate", "*.tfstate.backup" },
    command = "set filetype=json",
})
