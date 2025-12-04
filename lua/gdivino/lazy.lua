local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- ========== telescope ==========
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- ========== treesitter ==========
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    { "nvim-treesitter/playground" },

    -- ========== fonts ==========
    {
        "rose-pine/neovim",
        name = "rose-pine"
    },

    -- ========== harpoon ==========
    {
        "theprimeagen/harpoon",
        branch = "harpoon2"
    },

    -- ========== undotree ==========
    { "mbbill/undotree" },

    -- ========== fugitive ==========
    { "GDivino/vim-fugitive" },
    -- { "tpope/vim-fugitive" },

    -- ========== LSP ==========
    { "mason-org/mason.nvim" },
    { "mason-org/mason-lspconfig.nvim" },
    { "L3MON4D3/LuaSnip" },
    { "neovim/nvim-lspconfig" },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'default' },

            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },

    -- ========== nerdcommenter ==========
    -- { "preservim/nerdcommenter" },
    { "GDivino/nerdcommenter" },

    -- ========== yaml neovim ==========
    {
        "GDivino/yaml.nvim",
        -- "cuducos/yaml.nvim",
        ft = { "yaml" }, -- optional
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim", -- optional
        },
    },

    -- ========== lualine ==========
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", opt = true,
        }
    },

    -- ========== copilot ==========
    -- { "github/copilot.vim" },
    -- {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     dependencies = {
    --         { "nvim-lua/plenary.nvim", branch = "master" },
    --     },
    --     build = "make tiktoken",
    --     opts = {
    --         -- See Configuration section for options
    --     },
    -- },

    -- ========== nvim autopairs ==========
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    -- ========== noice.nvim ==========
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    -- ========== indent-blankline.nvim ==========
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },

    -- ========== oil.nvim ==========
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },

    -- ========== markdown preview ==========
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}

require("lazy").setup(plugins, opts)
