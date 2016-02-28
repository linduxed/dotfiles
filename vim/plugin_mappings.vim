" {{{1 EasyMotion

nmap <Leader><Leader>a <Plug>(easymotion-jumptoanywhere)
nmap <Leader><Leader>s <Plug>(easymotion-sn)
nmap <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>F <Plug>(easymotion-overwin-f)
nmap <Leader><Leader>p <Plug>(easymotion-bd-t)
nmap <Leader><Leader>y <Plug>(easymotion-bd-w)
nmap <Leader><Leader>Y <Plug>(easymotion-bd-W)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-w)
nmap <Leader><Leader>i <Plug>(easymotion-bd-e)
nmap <Leader><Leader>I <Plug>(easymotion-bd-E)
nmap <Leader><Leader>e <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>u <Plug>(easymotion-overwin-line)
nmap <Leader><Leader>k <Plug>(easymotion-bd-n)

" {{{1 incsearch

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

augroup incsearch-keymap
  autocmd!
  autocmd VimEnter * call s:incsearch_keymap()
augroup END
function! s:incsearch_keymap()
  IncSearchNoreMap <C-i> <Over>(incsearch-next)
  IncSearchNoreMap <C-n> <Over>(incsearch-prev)
  IncSearchNoreMap <C-h> <Over>(incsearch-scroll-f)
  IncSearchNoreMap <C-j> <Over>(incsearch-scroll-b)
endfunction

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

" {{{1 SnipMate

imap <C-h>      <Plug>snipMateNextOrTrigger
smap <C-h>      <Plug>snipMateNextOrTrigger
imap <C-b>      <Plug>snipMateBack
smap <C-b>      <Plug>snipMateBack
imap <C-r><C-h> <Plug>snipMateShow
smap <C-r><C-h> <Plug>snipMateShow

" {{{1 Tabularize

vnoremap <Leader>ate :Tabularize / = /l0<CR>
nnoremap <Leader>ate :Tabularize / = /l0<CR>
vnoremap <Leader>atc :Tabularize /:\zs/l0l1<CR>
nnoremap <Leader>atc :Tabularize /:\zs/l0l1<CR>

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

" {{{1 Colemak

nnoremap <Leader>alc :ColemakEnable<CR>
nnoremap <Leader>alq :ColemakDisable<CR>

" {{{1 StripTrailingWhitespace

nnoremap <silent> <Leader>aw :StripTrailingWhitespace<CR>

" {{{1 fzf

nnoremap <C-p> :FZF<CR>
