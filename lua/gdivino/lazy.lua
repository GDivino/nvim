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

  -- ========== treesitter ==========
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  { 'nvim-treesitter/playground' },

  -- ========== fonts ==========
  {
    'rose-pine/neovim',
    name = 'rose-pine'
  },

  -- ========== harpoon ==========
  { 'theprimeagen/harpoon' },

  -- ========== undotree ==========
  { 'mbbill/undotree' },

  -- ========== fugitive ==========
  { 'tpope/vim-fugitive' },

  -- ========== LSP ==========
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x'
  },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'L3MON4D3/LuaSnip' },

  -- ========== nerdcommenter ==========
  { 'preservim/nerdcommenter' },

  -- ========== yaml neovim ==========
  {
    'cuducos/yaml.nvim',
    ft = { 'yaml' }, -- optional
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
    },
  },

  -- ========== lualine ==========
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', opt = true,
    },
  },

  -- ========== copilot ==========
  { 'github/copilot.vim' },

  -- ========== octo ==========
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  },
}

require('lazy').setup(plugins, opts)
