-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
    { desc = "Split line" }
)

-- {{{2 File name

vim.keymap.set("n",
    "<leader>apf",
    "<cmd>echo @%<CR>",
    { desc = "File name - Print" }
)
vim.keymap.set("n",
    "<leader>ayf",
    '<cmd>let @+=@%<Bar>echo @% "- yanked"<CR>',
    { desc = "Yank - Filename" }
)

-- {{{2 Windows

vim.keymap.set("n", "<leader>wa", "<c-w>p", { desc = "Previous window" })

-- {{{2 Miscellaneous

vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command-mode (:)" })
vim.keymap.set("v", "<leader><leader>", ":", { desc = "Command-mode (:)" })


vim.keymap.set("n", "<leader>fl", "<cmd>e<cr>", { desc = "File re(l)oad (:e)" })

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

vim.keymap.set("n", "<S-Up>", "<C-y>")
vim.keymap.set("n", "<S-Down>", "<C-e>")

vim.keymap.set("n", "z<Up>", "zk")
vim.keymap.set("n", "z<Down>", "zj")

-- {{{2 Function keys

vim.keymap.set("n", "<F1>", "<cmd>buffer #<cr>")
vim.keymap.set("n", "<F2>", function() Snacks.picker.buffers() end)
vim.keymap.set("n", "<F3>", function() Snacks.picker.git_files() end)
-- F4: not bound.
-- F5: not bound.
-- F6: not bound.
-- F7: not bound.
-- F8: not bound.
-- F9: not bound.
-- F10: bound elsewhere -- outline.nvim
-- F11: bound elsewhere -- outline.nvim
vim.keymap.set("n", "<F12>", function() Snacks.explorer() end)

-- Keep the cursor in place while joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- {{{1 Miscellaneous (Vimscript)

vim.cmd([[
" Reselection of pasted text (linewise or not, it adjusts)
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

tnoremap <C-\> <C-\><C-n>
]])
