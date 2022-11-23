-- {{{1 Colemak

vim.cmd([[
nnoremap <Leader>ace :ColemakEnable<CR>
nnoremap <Leader>acd :ColemakDisable<CR>
]])

-- {{{1 dial.nvim

vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal())
vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal())
vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual())
vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual())
vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual())
vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual())

-- {{{1 gitgutter

vim.cmd([[
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap <silent> <Leader>agtb :GitGutterLineHighlightsToggle<CR>
nmap <silent> <Leader>agtn :GitGutterLineNrHighlightsToggle<CR>
nmap <silent> <Leader>agts :GitGutterSignsToggle<CR>
nmap <silent> <Leader>agf :GitGutterFold<CR>
nmap <silent> <Leader>ags :GitGutterStageHunk<CR>
nmap <silent> <Leader>agu :GitGutterUndoHunk<CR>
nmap <silent> <Leader>agp :GitGutterPreviewHunk<CR>
]])

-- {{{1 Goyo

vim.cmd([[
nmap <silent> <Leader>go :Goyo<CR>
]])

-- {{{1 grepper

vim.cmd([[
nmap gr <plug>(GrepperOperator)
xmap gr <plug>(GrepperOperator)
nmap <Leader>gr :Grepper<CR>
]])

-- {{{1 Mark

vim.cmd([[
nmap <Leader>mm <Plug>MarkSet
xmap <Leader>mm <Plug>MarkSet
nmap <Leader>mr <Plug>MarkRegex
xmap <Leader>mr <Plug>MarkRegex
nmap <Leader>mt <Plug>MarkToggle
nmap <Leader>mx <Plug>MarkClear
nmap <Leader>mc <Plug>MarkAllClear
nmap <Leader>m* <Plug>MarkSearchCurrentNext
nmap <Leader>m# <Plug>MarkSearchCurrentPrev
nmap <Leader>m/ <Plug>MarkSearchAnyNext
nmap <Leader>m? <Plug>MarkSearchAnyPrev
]])

-- {{{1 leap.nvim

vim.keymap.set({"n"}, "gy", "<Plug>(leap-forward)")
vim.keymap.set({"n"}, "gl", "<Plug>(leap-backward)")
vim.keymap.set({"o"}, "gy", "<Plug>(leap-forward)")
vim.keymap.set({"o"}, "gl", "<Plug>(leap-backward)")
vim.keymap.set({"x"}, "gy", "<Plug>(leap-forward)")
vim.keymap.set({"x"}, "gl", "<Plug>(leap-backward)")
vim.keymap.set({"n", "x", "o"}, "gws", "<Plug>(leap-cross-window)")

-- {{{1 LuaSnip

vim.cmd([[
" press <Tab> to expand or jump in a snippet. These can also be mapped
" separately " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

command! LuaSnipEdit :lua require("luasnip.loaders").edit_snippet_files()
]])

vim.keymap.set("n", "<Leader>rse", "<cmd>LuaSnipEdit<CR>")

-- {{{1 NERDtree

vim.cmd([[
let g:NERDTreeMapOpenExpl = 'y'
let g:NERDTreeMapUpdir = 'l'
let g:NERDTreeMapUpdirKeepOpen = 'L'
let g:NERDTreeMapJumpFirstChild = 'U'
let g:NERDTreeMapJumpLastChild = 'E'
let g:NERDTreeMapJumpPrevSibling = '<C-u>'
let g:NERDTreeMapJumpNextSibling = '<C-e>'
]])

-- {{{1 repeat

vim.cmd([[
nnoremap z <Plug>(RepeatUndo)
nnoremap gz <Plug>(RepeatUndo)
nnoremap Z <Plug>(RepeatUndo)
]])

-- {{{1 sayonara

vim.cmd([[
nmap <leader>aq :Sayonara<CR>
nmap <leader>abq :Sayonara!<CR>
]])

-- {{{1 StripTrailingWhitespace

vim.cmd([[
nnoremap <silent> <Leader>awk :StripTrailingWhitespace<CR>
]])

-- {{{1 surround

vim.cmd([[
let g:surround_no_mappings = 1

nmap ds  <Plug>Dsurround
nmap ws  <Plug>Csurround
nmap wS  <Plug>CSurround
nmap cs  <Plug>Ysurround
nmap cS  <Plug>YSurround
nmap css <Plug>Yssurround
nmap cSs <Plug>YSsurround
nmap cSS <Plug>YSsurround
xmap s   <Plug>VSurround
xmap gs  <Plug>VgSurround
]])

-- {{{1 swap

vim.cmd([[
let g:swap_no_default_key_mappings = 1
]])

vim.keymap.set({"n"}, "g<", "<Plug>(swap-prev)")
vim.keymap.set({"n"}, "g>", "<Plug>(swap-next)")
vim.keymap.set({"n", "x"}, "gm", "<Plug>(swap-interactive)")

-- {{{1 Tabularize

vim.cmd([[
vnoremap <Leader>ate :Tabularize / = /l0<CR>
nnoremap <Leader>ate :Tabularize / = /l0<CR>
vnoremap <Leader>atc :Tabularize /:\zs/l0l1<CR>
nnoremap <Leader>atc :Tabularize /:\zs/l0l1<CR>
]])

-- {{{1 Telescope

vim.cmd([[
" Main mappings
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files({follow = true})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').grep_string({ shorten_path = true, word_match = "-w", only_sort_text = true, search = '' })<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>fap <cmd>lua require('telescope.builtin').builtin()<cr>

" LSP mappings
nnoremap <leader>alr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>ali <cmd>lua require('telescope.builtin').lsp_implementations()<cr>
]])

-- {{{1 TextObjects

vim.cmd([[
" Bindings adjusted to work with colemak.vim.
xmap tr <Plug>(textobj-rubyblock-a)
omap tr <Plug>(textobj-rubyblock-a)
xmap rr <Plug>(textobj-rubyblock-i)
omap rr <Plug>(textobj-rubyblock-i)
xmap ti <Plug>(textobj-indent-a)
omap ti <Plug>(textobj-indent-a)
xmap ri <Plug>(textobj-indent-i)
omap ri <Plug>(textobj-indent-i)
xmap tS <Plug>(textobj-space-a)
omap tS <Plug>(textobj-space-a)
xmap rS <Plug>(textobj-space-i)
omap rS <Plug>(textobj-space-i)
xmap t_ <Plug>(textobj-underscore-a)
omap t_ <Plug>(textobj-underscore-a)
xmap r_ <Plug>(textobj-underscore-i)
omap r_ <Plug>(textobj-underscore-i)
xmap tu <Plug>(textobj-url-a)
omap tu <Plug>(textobj-url-a)
xmap ru <Plug>(textobj-url-i)
omap ru <Plug>(textobj-url-i)
]])

-- {{{1 unimpaired

vim.cmd([[
" These are not actual mappings for unimpaired, however they try to compliment
" the existing mappings from the plugin.

nnoremap [<C-q> :colder<CR>
nnoremap ]<C-q> :cnewer<CR>
nnoremap [<C-l> :lolder<CR>
nnoremap ]<C-l> :lnewer<CR>
]])

-- {{{1 vimwiki

vim.cmd([[
let g:vimwiki_map_prefix = '<Leader>an'
let g:vimwiki_table_mappings = 0

" See ftplugin/vimwiki.vim for more mappings.
" It seems like the Vimwiki plugin prefers to have the local
" mappings defined over in the ftplugin file.
]])

-- {{{1 wheel

vim.cmd([[
let g:wheel#map#up   = 'U'
let g:wheel#map#down = 'E'
]])

-- {{{1 zettel

vim.cmd([[
let g:zettel_default_mappings = 0

" See ftplugin/vimwiki.vim for more mappings.
" It seems like the Vimwiki plugin prefers to have the local
" mappings defined over in the ftplugin file.
]])
