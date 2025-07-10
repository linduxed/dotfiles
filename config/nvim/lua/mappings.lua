-- {{{1 Miscellaneous (Lua)

-- {{{2 Folds
vim.keymap.set("n", "<Leader>afr", "zMzvzz", { desc = '"Refocus" folds' })
vim.keymap.set("n",
    "<leader>afmi",
    function() vim.opt.foldmethod = "indent" end,
    { desc = "Foldmethod - Indent" }
)
vim.keymap.set("n",
    "<leader>afmm",
    function() vim.opt.foldmethod = "marker" end,
    { desc = "Foldmethod - Marker" }
)

-- {{{2 Spelling
vim.keymap.set("n",
    "<leader>asle",
    function() vim.opt.spelllang = "en" end,
    { desc = "Spell language - EN" }
)
vim.keymap.set("n",
    "<leader>asls",
    function() vim.opt.spelllang = "sv" end,
    { desc = "Spell language - SV" }
)
vim.keymap.set("n",
    "<leader>aslp",
    function() vim.opt.spelllang = "pl" end,
    { desc = "Spell language - PL" }
)

-- {{{2 Split line and remove potential trailing whitespace

vim.keymap.set(
    "n",
    "<Leader><CR>",
    function()
        vim.cmd([[
            exe "norm! i\<CR>"
            norm! ^mwgk
            s/\v *$//
            norm! `w
            delmarks w
            nohlsearch
        ]])
    end,
    { desc = "Split line and remove trailing whitespace" }
)

-- {{{2 File name

vim.keymap.set("n",
    "<leader>pp",
    "<cmd>echo @%<CR>",
    { desc = "File name - Echo" }
)
vim.keymap.set("n",
    "<leader>py",
    '<cmd>let @+=@%<Bar>echo @% "- yanked"<CR>',
    { desc = "File name - Yank and Echo" }
)

-- {{{2 Tabs

vim.keymap.set("n", "]v", "<cmd>tabnext<CR>", { desc = "Tab - Next" })
vim.keymap.set("n", "[v", "<cmd>tabprevious<CR>", { desc = "Tab - Previous" })
vim.keymap.set("n", "]V", "<cmd>tabmove +1<CR>", { desc = "Tab - Move right" })
vim.keymap.set("n", "[V", "<cmd>tabmove -1<CR>", { desc = "Tab - Move left" })

-- {{{2 Miscellaneous

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "File - Write (:w)" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Window - Quit (:q)" })
vim.keymap.set("n", "<leader>e", "<cmd>e<cr>", { desc = "File - Reload (:e)" })

vim.keymap.set("n", "<leader>atz", function() vim.o.tw = 0 end, { desc = "Text width = 0" })
vim.keymap.set("n", "<leader>atg", function() vim.o.tw = 72 end, { desc = "Text width = 72 (gitcommit)" })
vim.keymap.set("n", "<leader>ate", function() vim.o.tw = 80 end, { desc = "Text width = 80" })

vim.keymap.set(
    "n",
    "<leader>aws",
    "<CMD>StripTrailingWhitespace<CR>",
    { desc = "Strip trailing whitespace" }
)

vim.keymap.set("n", "<leader>ayb", 'gg"+yG', { desc = "Yank - Contents of buffer" })

-- {{{1 Miscellaneous (Vimscript)

vim.cmd([[
"" {{{2 Miscellaneous
" Help file navigation
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|

" Reselection of pasted text (linewise or not, it adjusts)
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap <leader>/ :nohlsearch<CR>

tnoremap <C-\> <C-\><C-n>

nnoremap <S-Up> <C-y>
nnoremap <S-Down> <C-e>

nnoremap z<Up> zk
nnoremap z<Down> zj

" {{{2 Function keys

nnoremap <F1> :buffer #<CR>
nnoremap <F2> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <F3> <cmd>lua require('telescope.builtin').tags()<cr>
nnoremap <F4> <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <F5> <cmd>lua require('telescope.builtin').oldfiles()<cr>
" F6: bound elsewhere -- Telescope undo
" F7: not bound.
" F8: not bound.
" F9: not bound.
" F10: bound elsewhere -- outline.nvim
nnoremap <F11> :Vista!!<CR>
nnoremap <F12> <cmd>Neotree toggle<CR>

" {{{2 Change behaviour of standard functions

" Keep search matches in the middle of the window.
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Keep the cursor in place while joining lines
nnoremap J mzJ`z
]])
