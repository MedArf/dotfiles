return{
  "christoomey/vim-tmux-navigator",
  vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { noremap = true, silent = true }),
  vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { noremap = true, silent = true }),
  vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { noremap = true, silent = true }),
  vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { noremap = true, silent = true }),
}


