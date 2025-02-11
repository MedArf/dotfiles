return {
"folke/neodev.nvim",
"folke/which-key.nvim",
{ "folke/neoconf.nvim", cmd = "Neoconf" },
{
'navarasu/onedark.nvim',
lazy = false, -- make sure we load this during startup if it is your main colorscheme
priority = 1000, -- make sure to load this before all the other start plugins
},

    {
   "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
 },
-- Other color schemes:
{ 'rebelot/kanagawa.nvim', lazy = true },
{ 'tanvirtin/monokai.nvim', lazy = true },
{ 'https://github.com/rose-pine/neovim', name = 'rose-pine', lazy = true },

-- Icons
{ 'kyazdani42/nvim-web-devicons', lazy = true },

-- Dashboard (start screen)
{
'goolord/alpha-nvim',
dependencies = { 'kyazdani42/nvim-web-devicons' },
},

-- Git labels
{
'lewis6991/gitsigns.nvim',
lazy = true,
dependencies = {
'nvim-lua/plenary.nvim',
'kyazdani42/nvim-web-devicons',
},
config = function()
require('gitsigns').setup{}
end
},

-- File explorer
{
'kyazdani42/nvim-tree.lua',
dependencies = { 'kyazdani42/nvim-web-devicons' },
},

-- Treesitter

-- Indent line
{ 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

-- Tag viewer
{ 'preservim/tagbar' },

-- Autopair
{
'windwp/nvim-autopairs',
event = 'InsertEnter',
config = function()
require('nvim-autopairs').setup{}
end
},

-- LSP
{ 'neovim/nvim-lspconfig',
},
-- VenvSelector
{
'linux-cultist/venv-selector.nvim',
dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
opts = {
-- Your options go here
-- name = "venv",
-- auto_refresh = false
},
event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
keys = {
-- Keymap to open VenvSelector to pick a venv.
{ '<leader>vs', '<cmd>VenvSelect<cr>' },
-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
{ '<leader>vc', '<cmd>VenvSelectCached<cr>' },
},
},
-- Code_Runner
--{ "CRAG666/code_runner.nvim", config = true },
--Telescope
{
'nvim-telescope/telescope.nvim', tag = '0.1.8',
dependencies = { 'nvim-lua/plenary.nvim' }
},
--Vim-fugitive
{"tpope/vim-fugitive"},
{'ray-x/web-tools.nvim',
dependencies = {
'hrsh7th/vscode-langservers-extracted',
'microsoft/vscode-html-languageservice',
},
},
--AI Assistant
--{"github/copilot.vim"},
{'Exafunction/codeium.vim'},
-- Autocomplete
{
'hrsh7th/nvim-cmp',
-- load cmp on InsertEnter
event = 'InsertEnter',
-- these dependencies will only be loaded when cmp loads
-- dependencies are always lazy-loaded unless specified otherwise
dependencies = {
'L3MON4D3/LuaSnip',
'hrsh7th/cmp-nvim-lsp',
'hrsh7th/cmp-path',
'hrsh7th/cmp-buffer',
'saadparwaiz1/cmp_luasnip',
},
},
{'dgrbrady/nvim-docker',
requires = {'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'},
rocks = '4O4/reactivex' -- ReactiveX Lua implementation,
}
}
