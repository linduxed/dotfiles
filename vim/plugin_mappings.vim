" {{{1 CTRLP

let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-k>'],
    \ 'PrtSelectMove("j")':   ['<c-e>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-u>', '<up>'],
    \ 'PrtHistory(-1)':       ['<c-j>'],
    \ 'PrtHistory(1)':        ['<c-h>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>', '<MiddleMouse>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<c-q>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtCurStart()':        ['<c-l>'],
    \ 'PrtCurEnd()':          ['<c-y>'],
    \ 'PrtCurLeft()':         ['<c-n>', '<left>'],
    \ 'PrtCurRight()':        ['<c-i>', '<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteMRU()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-g>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>'],
    \ }

" {{{1 EasyMotion

let g:EasyMotion_mapping_f = '<Leader><Leader>f'
let g:EasyMotion_mapping_F = '<Leader><Leader>F'
let g:EasyMotion_mapping_t = '<Leader><Leader>p'
let g:EasyMotion_mapping_T = '<Leader><Leader>P'
let g:EasyMotion_mapping_w = '<Leader><Leader>y'
let g:EasyMotion_mapping_W = '<Leader><Leader>Y'
let g:EasyMotion_mapping_b = '<Leader><Leader>l'
let g:EasyMotion_mapping_B = '<Leader><Leader>L'
let g:EasyMotion_mapping_e = '<Leader><Leader>i'
let g:EasyMotion_mapping_E = '<Leader><Leader>I'
let g:EasyMotion_mapping_ge = '<Leader><Leader>n'
let g:EasyMotion_mapping_gE = '<Leader><Leader>N'
let g:EasyMotion_mapping_j = '<Leader><Leader>e'
let g:EasyMotion_mapping_k = '<Leader><Leader>u'
let g:EasyMotion_mapping_n = '<Leader><Leader>k'
let g:EasyMotion_mapping_N = '<Leader><Leader>K'

" {{{1 IndentGuides

nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" {{{1 Rspec

nmap <Leader>st :call RunCurrentSpecFile()<CR>
nmap <Leader>sr :call RunNearestSpec()<CR>
nmap <Leader>ss :call RunLastSpec()<CR>

" {{{1 Signify

nmap <leader>ge <plug>(signify-next-jump)
nmap <leader>gu <plug>(signify-prev-jump)

" {{{1 SnipMate

imap <C-h>      <Plug>snipMateNextOrTrigger
smap <C-h>      <Plug>snipMateNextOrTrigger
imap <C-b>      <Plug>snipMateBack
smap <C-b>      <Plug>snipMateBack
imap <C-r><C-h> <Plug>snipMateShow
smap <C-r><C-h> <Plug>snipMateShow

" {{{1 Tabularize

vnoremap <Leader>te :Tabularize / = /l0<CR>
nnoremap <Leader>te :Tabularize / = /l0<CR>
vnoremap <Leader>tc :Tabularize /:\zs/l0l1<CR>
nnoremap <Leader>tc :Tabularize /:\zs/l0l1<CR>

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

nnoremap <Leader>lc :ColemakEnable<CR>
nnoremap <Leader>lq :ColemakDisable<CR>

" {{{1 StripTrailingWhitespace

nnoremap <silent> <Leader>kw :StripTrailingWhitespace<CR>
