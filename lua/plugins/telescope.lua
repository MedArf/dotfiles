return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
   dependencies = { 'nvim-lua/plenary.nvim' },
   require('telescope').setup{
   	picker = {
	   	find_files = {
			additional_args = { "--hidden" }
	   	},
   	}
}
}
