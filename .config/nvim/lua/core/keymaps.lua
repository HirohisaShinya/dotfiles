-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- for US keyboard
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')


vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')
vim.keymap.set('', '<C-j>', '<C-d>')
vim.keymap.set('', '<C-k>', '<C-u>')
vim.keymap.set('', '<C-l>', '$')
vim.keymap.set('', '<C-h>', '^')

vim.keymap.set('', '<C-Space>', '<esc>')
vim.keymap.set('i', '<C-Space>', '<esc>:set iminsert=0<CR>')
vim.keymap.set('i', '<esc>', '<esc>:set iminsert=0<CR>')


vim.keymap.set('', '<s-f>', ':%s///gc<left><left><left><left>')
vim.keymap.set('v', '//', 'y/<C-R>=escape(@", \'\\/.*$^~[]\')<CR><CR>')
vim.keymap.set('v', '/r', '"xy:%s/<C-R>=escape(@x, \'\\/.*$^~[]\')<CR>//gc<Left><Left><Left>')
vim.keymap.set('v', '/gr', '"xy:%s/<C-R>=escape(@x, \'\\/.*$^~[]\')<CR>/<C-R>=escape(@x, \'\\/.*$^~[]\')<CR>/gc<Left><Left><Left>')

vim.keymap.set('n', '""', 'vi"')
vim.keymap.set('n', "''", "vi'")
vim.keymap.set('n', '((', 'vi(')
vim.keymap.set('n', '[[', 'vi[')
vim.keymap.set('n', '{{', 'vi{')

vim.keymap.set('n', 'yp', ':let @* = expand(\'%:p\')<CR>')
vim.keymap.set('n', 'yh', ':let @* = expand(\'%:h\')<CR>')
vim.keymap.set('n', 'yt', ':let @* = expand(\'%:t\')<CR>')
