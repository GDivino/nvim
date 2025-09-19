-- ========== lspconfig ==========

vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using (most
                -- likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                -- (see `:h lua-module-load`)
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths
                    -- here.
                    -- '${3rd}/luv/library'
                    -- '${3rd}/busted/library'
                }
                -- Or pull in all of 'runtimepath'.
                -- NOTE: this is a lot slower and will cause issues when working on
                -- your own configuration.
                -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                -- library = {
                --   vim.api.nvim_get_runtime_file('', true),
                -- }
            }
        })
    end,
    settings = {
        Lua = {}
    }
})
vim.lsp.config('ts_ls', {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
    },
})
vim.lsp.config('bashls', {
    filetypes = { "bash", "sh" },
    single_file_support = true
})
local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config('eslint', {
    on_attach = function(client, bufnr)
        if not base_on_attach then return end

        base_on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "LspEslintFixAll",
        })
    end,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" }
})
vim.lsp.config('ruby_lsp', {
    cmd = { "ruby-lsp" },
    filetypes = { "ruby", "eruby" },
    init_options = {
        formatter = "standard",
        linters = { "standard" }
    },
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('bashls')
vim.lsp.enable('terraformls')
vim.lsp.enable('eslint')
vim.lsp.enable('pylsp')
vim.lsp.enable('jsonls')
vim.lsp.enable('ruby_lsp')

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

-- ========== CMP ==========


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
