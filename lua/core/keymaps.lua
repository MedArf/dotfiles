-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------
-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')
-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

--Screen redimension
--Horizontal
map('n', '<', '<C-w><')
map('n', '>', '<C-w>>')
--Vertical
map('n', '+', '<C-w>+')
map('n', '-', '<C-w>-')
-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

map('n', '<C-]>', '<C-w><C-]><C-w>T' )

----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------
--Find files using Telescope command-line sugar.
map('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = false})
map('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = false})
map('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true, silent = false})
map('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = false})
-- Terminal mappings

map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>f', ':NvimTreeFindFile<CR>')      -- search file
-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

map('n', '<leader>x', ':RunCode<CR>', { noremap = true, silent = false })
map('n', '<leader>xf', ':RunFile<CR>', { noremap = true, silent = false })
map('n', '<leader>xft', ':RunFile tab<CR>', { noremap = true, silent = false })
map('n', '<leader>xp', ':RunProject<CR>', { noremap = true, silent = false })
map('n', '<leader>xc', ':RunClose<CR>', { noremap = true, silent = false })
map('n', '<leader>cxf', ':CRFiletype<CR>', { noremap = true, silent = false })
map('n', '<leader>cxp', ':CRProjects<CR>', { noremap = true, silent = false })
