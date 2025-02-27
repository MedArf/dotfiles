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
map('i', '<Esc>', '<Esc>')


-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')
-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', 'h', '<C-w>h')
map('n', 'j', '<C-w>j')
map('n', 'k', '<C-w>k')
map('n', 'l', '<C-w>l')

--Screen redimension
--Horizontal
map('n', '<', '<C-w><', { noremap = true, silent = false })
map('n', '>', '<C-w>>', { noremap = true, silent = false })
--Vertical
map('n', '+', '<C-w>+')
map('n', '-', '<C-w>-')
-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving withTleader> and s
map('n', '<leader>s', ':w<CR>', { noremap = true, silent = false })

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
--00lmap('t', '<Esc>', '<C-\\><C-n>')                    -- exit

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

local non_c_line_comments_by_filetype = {
    lua = "--",
    python = "#",
    sql = "--",
}

local function comment_out(opts)
    local line_comment = non_c_line_comments_by_filetype[vim.bo.filetype] or "//"
    local start = math.min(opts.line1, opts.line2)
    local finish = math.max(opts.line1, opts.line2)

    vim.api.nvim_command(start .. "," .. finish .. "s:^:" .. line_comment .. ":")
    vim.api.nvim_command("noh")
end

local function uncomment(opts)
    local line_comment = non_c_line_comments_by_filetype[vim.bo.filetype] or "//"
    local start = math.min(opts.line1, opts.line2)
    local finish = math.max(opts.line1, opts.line2)

    pcall(vim.api.nvim_command, start .. "," .. finish .. "s:^\\(\\s\\{-\\}\\)" .. line_comment .. ":\\1:")
    vim.api.nvim_command("noh")
end

vim.api.nvim_create_user_command("CommentOut", comment_out, { range = true })
vim.api.nvim_create_user_command("Uncomment", uncomment, { range = true })
map('v', '<leader>c', ':Comment<CR>')
map('n', '<leader>c', ':Comment<CR>')
map('v', '<leader>uc', ':Uncomment<CR>')
map('n', '<leader>uc', ':Uncomment<CR>')
vim.g.copilot_no_tab_map = true
vim.g.codeium_disable_bindings = true
map('i', '<C-\\>',"codeium#Accept()", {noremap = true, silent = true, expr = true })
map('i', '<C-Escape>', "codeium#Clear()", {noremap = true, silent = true, expr = true })
map('i', '<C-.>', "codeium#CycleCompletions(1)", {noremap = true, silent = true, expr = true })
map('i', '<C-,>', "codeium#CycleCompletions(-1)", { silent = true, expr = true })

map('n','<leader>gp', ":Gitsigns preview_hunk<CR>",{noremap = true, silent = true})
map('n','<leader>gt', ":Gitsigns toggle_current_line_blame<CR>",{noremap = true, silent = true})

map("n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true })
map("n", "<leader>t", ":TestFile<CR>", { noremap = true, silent = true })
map("n", "<leader>a", ":TestSuite<CR>", { noremap = true, silent = true })
map("n", "<leader>l", ":TestLast<CR>", { noremap = true, silent = true })
map("n", "<leader>g", ":TestVisit<CR>", { noremap = true, silent = true })

--windows moving
--remap C-W C-X
