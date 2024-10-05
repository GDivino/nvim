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

    -- ========== fonts ==========
    {
        "rose-pine/neovim",
        name = "rose-pine"
    },

    -- ========== harpoon ==========
    { "theprimeagen/harpoon" },

    -- ========== undotree ==========
    { "mbbill/undotree" },

    -- ========== fugitive ==========
    { "tpope/vim-fugitive" },

    -- ========== nerdcommenter ==========
    { "preservim/nerdcommenter" },

    -- ========== lualine ==========
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", opt = true,
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
}

require("lazy").setup(plugins, opts)
