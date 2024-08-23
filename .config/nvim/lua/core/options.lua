vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('scrolloff', 5)
vim.api.nvim_set_option('clipboard', 'unnamedplus')

--

vim.api.nvim_set_option('splitright', true)
vim.api.nvim_set_option('hls', true)
vim.api.nvim_set_option('whichwrap', 'b,s,h,l,<,>,[,]')
vim.api.nvim_set_option('showbreak', '++')
vim.api.nvim_set_option('pumblend', 20)
vim.api.nvim_set_option('modifiable', true)
vim.api.nvim_set_option('write', true)
-- vim.api.nvim_set_option('imdisable', true)
vim.api.nvim_set_option('iminsert', 0)
vim.api.nvim_set_option('imsearch', 0)
-- vim.api.nvim_set_option('noimcmdline', true)
-- vim.api.nvim_set_option('noswapfile', true)

--

vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'cursorline', true)
vim.api.nvim_win_set_option(0, 'signcolumn', 'yes:1')

vim.api.nvim_buf_set_option(0, 'tabstop', 2)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 2)
vim.api.nvim_buf_set_option(0, 'expandtab', true)


vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
