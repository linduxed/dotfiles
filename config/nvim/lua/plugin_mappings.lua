-- {{{1 Colemak

vim.cmd([[
nnoremap <Leader>ace :ColemakEnable<CR>
nnoremap <Leader>acd :ColemakDisable<CR>
]])

-- {{{1 coc

vim.cmd([[
" The following mapping is required, as without it <C-n> or <C-p> in the
" completion list results in snippets not expanding upon <CR>.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" For some reason these can not be nnoremap instead of nmap, if one uses the
" <Plug> invocations instead of :call Whatever<CR>.
nmap <Leader>all :CocList<CR>
nmap <Leader>ald <Plug>(coc-definition)
nmap <Leader>alf <Plug>(coc-format)
vmap <Leader>alf <Plug>(coc-format-selected)
nmap <silent> <Leader>alh :call CocAction("doHover")<CR>
nmap <Leader>alm <Plug>(coc-rename)
nmap <Leader>alr <Plug>(coc-references)
nmap <Leader>alc <Plug>(coc-codeaction)
nmap <Leader>alx <Plug>(coc-float-hide)
nmap <Leader>alo :CocCommand workspace.showOutput<CR>
imap <C-h> <Plug>(coc-snippets-expand)
vmap rf <Plug>(coc-funcobj-i)
vmap tf <Plug>(coc-funcobj-a)
nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-j>"
nnoremap <silent><nowait><expr> <C-h> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-h>"
]])

-- {{{1 EasyMotion

vim.cmd([[
map <Leader><Leader>a <Plug>(easymotion-jumptoanywhere)
map <Leader><Leader>s <Plug>(easymotion-sn)
map <Leader><Leader>f <Plug>(easymotion-bd-f)
map <Leader><Leader>F <Plug>(easymotion-overwin-f)
map <Leader><Leader>p <Plug>(easymotion-bd-t)
map <Leader><Leader>y <Plug>(easymotion-bd-w)
map <Leader><Leader>Y <Plug>(easymotion-bd-W)
map <Leader><Leader>l <Plug>(easymotion-overwin-w)
map <Leader><Leader>i <Plug>(easymotion-bd-e)
map <Leader><Leader>I <Plug>(easymotion-bd-E)
map <Leader><Leader>e <Plug>(easymotion-bd-jk)
map <Leader><Leader>u <Plug>(easymotion-overwin-line)
map <Leader><Leader>k <Plug>(easymotion-bd-n)

]])

-- {{{1 fzf

vim.cmd([[
nnoremap <C-p> :FZF<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :BLines<CR>
nnoremap <leader>fg :GFiles?<CR>
nnoremap <leader>fm :call fzf#vim#marks(0)<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fw :Windows<CR>
nnoremap <leader>fr :Rg<CR>
imap <C-x><C-l> <plug>(fzf-complete-line)
]])

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
nmap gl <plug>(GrepperOperator)
xmap gl <plug>(GrepperOperator)
nmap <Leader>gl :Grepper<CR>
]])

-- {{{1 incsearch

vim.cmd([[
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

function! s:incsearch_keymap()
  IncSearchNoreMap <C-i> <Over>(incsearch-next)
  IncSearchNoreMap <C-n> <Over>(incsearch-prev)
  IncSearchNoreMap <C-h> <Over>(incsearch-scroll-f)
  IncSearchNoreMap <C-j> <Over>(incsearch-scroll-b)
endfunction
augroup incsearch-keymap
  autocmd!
  autocmd VimEnter * call s:incsearch_keymap()
augroup END
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
nmap * <Plug>MarkSearchNext
nmap # <Plug>MarkSearchPrev
]])

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

-- {{{1 Tabularize

vim.cmd([[
vnoremap <Leader>ate :Tabularize / = /l0<CR>
nnoremap <Leader>ate :Tabularize / = /l0<CR>
vnoremap <Leader>atc :Tabularize /:\zs/l0l1<CR>
nnoremap <Leader>atc :Tabularize /:\zs/l0l1<CR>
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
