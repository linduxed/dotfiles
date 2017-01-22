" {{{1 Colemak

nnoremap <Leader>alc :ColemakEnable<CR>
nnoremap <Leader>alq :ColemakDisable<CR>

" {{{1 deoplete

nnoremap <Leader>ad :call deoplete#toggle()<CR>

" {{{1 EasyMotion

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

" {{{1 fzf

nnoremap <C-p> :FZF<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :BLines<CR>
nnoremap <leader>fm :call fzf#vim#marks(0)<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fw :Windows<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fs :Snippets<CR>

" {{{1 gitgutter

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk
nmap <silent> <Leader>agt <Plug>GitGutterLineHighlightsToggle
nmap <silent> <Leader>ags <Plug>GitGutterStageHunk
nmap <silent> <Leader>agr <Plug>GitGutterRevertHunk
nmap <silent> <Leader>agp <Plug>GitGutterPreviewHunk

" {{{1 grepper

nmap gl <plug>(GrepperOperator)
xmap gl <plug>(GrepperOperator)
nmap <Leader>gl :Grepper<CR>

" {{{1 IndentGuides

nmap <silent> <Leader>ai <Plug>IndentGuidesToggle

" {{{1 Mark

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

" {{{1 NERDtree

let g:NERDTreeMapOpenExpl = 'y'
let g:NERDTreeMapUpdir = 'l'
let g:NERDTreeMapUpdirKeepOpen = 'L'
let g:NERDTreeMapJumpFirstChild = 'U'
let g:NERDTreeMapJumpLastChild = 'E'
let g:NERDTreeMapJumpPrevSibling = '<C-u>'
let g:NERDTreeMapJumpNextSibling = '<C-e>'

" {{{1 repeat

nnoremap z <Plug>(RepeatUndo)
nnoremap gz <Plug>(RepeatUndo)
nnoremap Z <Plug>(RepeatUndo)

" {{{1 sayonara

nmap <leader>aq :Sayonara<CR>
nmap <leader>abq :Sayonara!<CR>


" {{{1 StripTrailingWhitespace

nnoremap <silent> <Leader>aw :StripTrailingWhitespace<CR>

" {{{1 Tabularize

vnoremap <Leader>ate :Tabularize / = /l0<CR>
nnoremap <Leader>ate :Tabularize / = /l0<CR>
vnoremap <Leader>atc :Tabularize /:\zs/l0l1<CR>
nnoremap <Leader>atc :Tabularize /:\zs/l0l1<CR>

" {{{1 UltiSnips

let g:UltiSnipsExpandTrigger="<C-h>"
let g:UltiSnipsListSnippets="<C-r><C-h>"
let g:UltiSnipsJumpForwardTrigger="<c-o>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" {{{1 TextObjects

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
" {{{1 wheel

let g:wheel#map#up   = 'U'
let g:wheel#map#down = 'E'
