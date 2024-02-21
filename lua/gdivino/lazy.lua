local lazypath = vim.fn.stdpath('data') .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- ========== telescope ==========
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- ========== fonts ==========
    {
        'rose-pine/neovim',
        name = 'rose-pine'
    },

    -- ========== treesitter ==========
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    { 'nvim-treesitter/playground' },

    -- ========== yaml neovim ==========
    {
        'cuducos/yaml.nvim',
        ft = { 'yaml' }, -- optional
        dependencies = {
            'nvim-telescope/telescope.nvim', -- optional
        },
    },

    -- ========== fugitive ==========
    { 'tpope/vim-fugitive' },


require('lazy').setup(plugins, opts)
