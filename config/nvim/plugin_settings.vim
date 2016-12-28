" {{{1 ack.vim

" Use Silver Searcher if present on the system.
if executable("ag")
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" {{{1 airline

let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#branch#displayed_head_limit = 12
let g:airline#extensions#capslock#enabled = 1
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''◆'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])

" {{{1 DelimitMate

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1

" {{{1 deoplete

let g:deoplete#enable_at_startup = 1
call deoplete#custom#set('_', 'converters',
    \ ['converter_remove_paren'])

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.lua = 'xolox#lua#omnifunc'

" {{{1 EasyMotion

hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment
hi link EasyMotionTarget2First Identifier
hi link EasyMotionTarget2Second Identifier

" Characters at the end of the string have higher precedence.
let g:EasyMotion_keys = 'hdoairesnt'

" {{{1 fugitive

let g:fugitive_no_maps = 1

" {{{1 Gist

let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'xdg-open %URL%'

" {{{1 gitgutter

let g:gitgutter_map_keys = 0

" {{{1 go

let g:go_textobj_enabled = 0

" {{{1 Goyo

function! s:goyo_enter()
  set nocursorcolumn
  set nocursorline
endfunction

function! s:goyo_leave()
  set cursorcolumn
  set cursorline
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" {{{1 haskell-vim

let g:haskell_indent_if = 3
let g:haskell_indent_case = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1

" {{{1 IndentGuides

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermfg=none ctermbg=234 cterm=none
hi IndentGuidesEven ctermfg=none ctermbg=235 cterm=none

" {{{1 lua-ftplugin

let g:lua_check_syntax = 0
let g:lua_complete_omni = 1
let g:lua_complete_dynamic = 0
let g:lua_define_completion_mappings = 0

" {{{1 Mark

let g:mwDefaultHighlightingPalette = [
\   { 'ctermbg':'Cyan',    'ctermfg':'Black' },
\   { 'ctermbg':'Green',   'ctermfg':'Black' },
\   { 'ctermbg':'Red',     'ctermfg':'Black' },
\   { 'ctermbg':'Magenta', 'ctermfg':'Black' },
\   { 'ctermbg':'Blue',    'ctermfg':'Black' },
\   { 'ctermfg':'White',   'ctermbg':'22' },
\   { 'ctermfg':'White',   'ctermbg':'27' },
\   { 'ctermfg':'White',   'ctermbg':'29' },
\   { 'ctermfg':'White',   'ctermbg':'34' },
\   { 'ctermfg':'Black',   'ctermbg':'37' },
\   { 'ctermfg':'Black',   'ctermbg':'43' },
\   { 'ctermfg':'White',   'ctermbg':'52' },
\   { 'ctermfg':'White',   'ctermbg':'53' },
\   { 'ctermfg':'White',   'ctermbg':'58' },
\   { 'ctermfg':'White',   'ctermbg':'60' },
\   { 'ctermfg':'White',   'ctermbg':'64' },
\   { 'ctermfg':'White',   'ctermbg':'65' },
\   { 'ctermfg':'Black',   'ctermbg':'66' },
\   { 'ctermfg':'Black',   'ctermbg':'72' },
\   { 'ctermfg':'Black',   'ctermbg':'74' },
\   { 'ctermfg':'Black',   'ctermbg':'78' },
\   { 'ctermfg':'Black',   'ctermbg':'79' },
\   { 'ctermfg':'Black',   'ctermbg':'85' },
\   { 'ctermfg':'White',   'ctermbg':'90' },
\   { 'ctermfg':'White',   'ctermbg':'95' },
\   { 'ctermfg':'White',   'ctermbg':'96' },
\   { 'ctermfg':'Black',   'ctermbg':'101' },
\   { 'ctermfg':'Black',   'ctermbg':'107' },
\   { 'ctermfg':'Black',   'ctermbg':'114' },
\   { 'ctermfg':'Black',   'ctermbg':'117' },
\   { 'ctermfg':'Black',   'ctermbg':'118' },
\   { 'ctermfg':'Black',   'ctermbg':'122' },
\   { 'ctermfg':'White',   'ctermbg':'130' },
\   { 'ctermfg':'White',   'ctermbg':'131' },
\   { 'ctermfg':'Black',   'ctermbg':'133' },
\   { 'ctermfg':'Black',   'ctermbg':'138' },
\   { 'ctermfg':'Black',   'ctermbg':'142' },
\   { 'ctermfg':'Black',   'ctermbg':'152' },
\   { 'ctermfg':'White',   'ctermbg':'160' },
\   { 'ctermfg':'Black',   'ctermbg':'166' },
\   { 'ctermfg':'Black',   'ctermbg':'169' },
\   { 'ctermfg':'Black',   'ctermbg':'174' },
\   { 'ctermfg':'Black',   'ctermbg':'175' },
\   { 'ctermfg':'Black',   'ctermbg':'186' },
\   { 'ctermfg':'Black',   'ctermbg':'190' },
\   { 'ctermfg':'White',   'ctermbg':'198' },
\   { 'ctermfg':'Black',   'ctermbg':'202' },
\   { 'ctermfg':'Black',   'ctermbg':'204' },
\   { 'ctermfg':'Black',   'ctermbg':'209' },
\   { 'ctermfg':'Black',   'ctermbg':'212' },
\   { 'ctermfg':'Black',   'ctermbg':'215' },
\   { 'ctermfg':'Black',   'ctermbg':'220' },
\   { 'ctermfg':'Black',   'ctermbg':'224' },
\   { 'ctermfg':'Black',   'ctermbg':'228' },
\]

" {{{1 Markdown

let g:markdown_fenced_languages = ['ruby', 'haskell', 'vim', 'sh', 'c']

" {{{1 Neomake

let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_warning_sign = {
  \ 'text': '>>',
  \ 'texthl': 'Todo',
  \ }
let g:neomake_error_sign = {
  \ 'texthl': 'Error',
  \ }
autocmd! BufWritePost * Neomake

" {{{1 NERDcommenter

let NERDSpaceDelims = 1 " Add spaces around the comment signs for all languages

" Since Alt style is not implemented at the moment, use custom delimiters instead.
let g:NERDCustomDelimiters = {
    \ 'haskell': { 'leftAlt': '{-','rightAlt': '-}', 'left': '--', 'right': '' },
    \ 'hspec': { 'leftAlt': '{-','rightAlt': '-}', 'left': '--', 'right': '' },
    \ 'c': { 'leftAlt': '/*','rightAlt': '*/', 'left': '//', 'right': '' },
\ }

" {{{1 NERDtree

let NERDTreeQuitOnOpen = 1

" {{{1 racer

let g:racer_cmd = "/usr/bin/racer"

" {{{1 RainbowParentheses

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare

" Haskell comment syntax breaks with Rainbow on.
autocmd Syntax * if &ft != "haskell" | exec "RainbowParenthesesLoadBraces" | endif

" Custom set of colours.
" Basically the defaults without the 'black' entry (poor visibility).
" Order has been moved around so that each step has more contrast.
let g:rbpt_colorpairs = [
    \ ['blue',        'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['blue',        'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" For the colours to loop properly, rbpt_max needs to equal the length
" of rbpt_colorpairs.
let g:rbpt_max = 15

" {{{1 rsi

let g:rsi_no_meta = 1

" {{{1 ruby

let g:no_ruby_maps = 1

" {{{1 TextObjects

" Default bindings disabled for remapping to colemak bindings.
let g:textobj_rubyblock_no_default_key_mappings = 1
let g:textobj_indent_no_default_key_mappings = 1
let g:textobj_space_no_default_key_mappings = 1
let g:textobj_underscore_no_default_key_mappings = 1
let g:textobj_url_no_default_key_mappings = 1

" {{{1 Tagbar

let g:tagbar_type_moon = {
    \ 'ctagstype' : 'moonscript',
    \ 'kinds'     : [
        \ 'v:variables',
        \ 'f:functions',
        \ 'c:classes',
        \ 'm:methods',
        \ 's:static properties',
        \ 'p:properties',
    \ ]
    \ }
" {{{1 UltiSnips

let g:snips_author = 'linduxed'
" {{{1 wheel

" Disable for mouse, due to erratic behavior.
let g:wheel#map#mouse = 0
