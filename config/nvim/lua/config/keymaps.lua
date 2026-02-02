-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- {{{1 Miscellaneous (Lua)

-- {{{2 LazyVim overrides

-- LazyVim opts to use HJKL as the main navigation keys. On my keyboard layout,
-- however, it's far more comfortable to make use of the arrow keys. Since
-- LazyVim already has mappings that make use of the arrow keys, it seems this
-- should be fine as a set of swaps.

-- Move to window using the <ctrl> arrow keys
vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-h>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-k>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("v", "<A-k>")
vim.keymap.set("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.set("n", "<S-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

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

vim.keymap.set("n", "<leader>wF", function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local cfg = vim.api.nvim_win_get_config(win)
        if cfg.relative ~= "" then
            vim.api.nvim_win_close(win, false)
        end
    end
end, { desc = "Floating windows - All close" })

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
