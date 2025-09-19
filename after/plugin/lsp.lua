-- ========== lspconfig ==========

vim.lsp.enable({
    'lua_ls',
    'ts_ls',
    'bashls',
    'terraformls',
    'eslint',
    'pylsp',
    'jsonls',
    'ruby_lsp',
})

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
})

-- ========== lspconfig ==========


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
        -- "yamlls",
        "jsonls",
        "ruby_lsp",
        "gopls",
    },
})

-- ========== LSP Mason ==========


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

autocmd("LspAttach", {
    group = GDivino_lsp,
    callback = function(event)
        vim.keymap.set("n", "<leader>gd", require("telescope.builtin").lsp_definitions, {
            buffer = event.buf,
            desc = "LSP: [G]oto [d]efinition",
        })

        vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references, {
            buffer = event.buf,
            desc = "LSP: [G]oto [R]eferences",
        })

        vim.keymap.set("n", "<leader>gI", require("telescope.builtin").lsp_implementations, {
            buffer = event.buf,
            desc = "LSP: [G]oto [I]mplementation",
        })

        vim.keymap.set("n", "<leader>gD", require("telescope.builtin").lsp_type_definitions, {
            buffer = event.buf,
            desc = "LSP: [G]oto Type [D]efinitions",
        })
    end
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

-- ========== autocmd ==========


-- ========== terraform autocmd ==========
local GDivino_tf_lsp = vim.api.nvim_create_augroup("GDivino_tf_lsp", {})
-- OLD AUTOCMD
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

-- ========== autocmd ==========
