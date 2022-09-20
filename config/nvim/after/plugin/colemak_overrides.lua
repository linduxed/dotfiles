-- {{{1 Replace colemak.vim search mappings, for nvim-hlslens
-- {{{2 Remove colemak.vim mappings

vim.keymap.del({"n", "x", "o"}, "k")
vim.keymap.del({"n", "x", "o"}, "K")

-- {{{2 nvim-hlslens

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'k',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'K',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
