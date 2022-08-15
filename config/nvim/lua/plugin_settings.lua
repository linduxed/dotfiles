-- {{{1 abolish

vim.cmd([[
let g:abolish_save_file = "/home/linduxed/.config/nvim/after/plugin/abolish.vim"
]])

-- {{{1 airline

vim.cmd([[
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#branch#displayed_head_limit = 12
let g:airline#extensions#capslock#enabled = 1
let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''◆'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
]])

-- {{{1 bullets

vim.cmd([[
let g:bullets_outline_levels = ['num']
let g:bullets_set_mappings = 0
]])

-- {{{1 context

vim.cmd([[
let g:context_add_mappings = 0
]])

-- {{{1 DelimitMate

vim.cmd([[
" This is the default, but is included here for clarity:
" The coc.vim completion menu needs a <CR> mapping to work reliably.
" Therefore this should not be set to 1.
let delimitMate_expand_cr = 0

let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1
]])

-- {{{1 ferret

vim.cmd([[
let g:FerretMap = 0
let g:FerretQFCommands = 0
]])

-- {{{1 fugitive

vim.cmd([[
let g:fugitive_no_maps = 1
]])

-- {{{1 Gist

vim.cmd([[
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'xdg-open %URL%'
]])

-- {{{1 gitgutter

vim.cmd([[
let g:gitgutter_map_keys = 0
]])

-- {{{1 Goyo

vim.cmd([[
let g:goyo_bg = 232

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
]])

-- {{{1 grepper

vim.cmd([[
let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'ag']
let g:grepper.highlight = 1
]])

-- {{{1 leap.nvim

require('leap').setup {
    -- Leaving the appropriate list empty effectively disables "smart" mode,
    -- and forces auto-jump to be on or off.
    safe_labels = {
        "f", "k", "z", "j", "h",
        "F", "K", "Z",
        "G",
        "/", "?",
    },
    labels = {
        "f", "k", "z", "j", "h",
        "n", "e", "i", "o", "l", "u", "y", "d", "m", "g",
        "F", "K", "Z",
        "G",
        "/", "?",
    },
}

-- {{{1 LuaSnip

require("luasnip.loaders.from_lua").load({
    paths = os.getenv("HOME") .. "/.config/nvim/snippets"
})
local ls = require("luasnip")

ls.config.set_config({
    -- Tells LuaSnip to remember to keep around the last snippet.
    -- One can jump back into it even if you move outside of the selection.
    history = false,

    -- This allows dynamic snippets to update as one types.
    update_events = "TextChanged,TextChangedI",
})

-- {{{1 Mark

vim.cmd([[
let g:mwDefaultHighlightingPalette = [
\   { 'ctermbg':'Blue',       'ctermfg':'Black' },
\   { 'ctermbg':'Green',      'ctermfg':'Black' },
\   { 'ctermbg':'Yellow',     'ctermfg':'Black' },
\   { 'ctermbg':'DarkCyan',   'ctermfg':'Black' },
\   { 'ctermbg':'DarkBlue',   'ctermfg':'Black' },
\   { 'ctermbg':'DarkMagenta','ctermfg':'Black' },
\   { 'ctermbg':'DarkRed',    'ctermfg':'Black' },
\   { 'ctermbg':'DarkGreen',  'ctermfg':'Black' },
\   { 'ctermbg':'Red',        'ctermfg':'Black' },
\   { 'ctermbg':'White',      'ctermfg':'Gray' },
\   { 'ctermbg':'LightGray',  'ctermfg':'White' },
\   { 'ctermbg':'Cyan',       'ctermfg':'Black' },
\   { 'ctermbg':'Brown',      'ctermfg':'Black' }
\]
]])

-- {{{1 Neomake

vim.cmd([[
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_elixir_enabled_makers = ['credo', 'dogma']
let g:neomake_warning_sign = {
  \ 'text': '>>',
  \ 'texthl': 'Todo',
  \ }
let g:neomake_error_sign = {
  \ 'texthl': 'Error',
  \ }
autocmd! BufWritePost * Neomake
]])

-- {{{1 NERDcommenter

vim.cmd([[
let NERDSpaceDelims = 1 " Add spaces around the comment signs for all languages
let NERDDefaultAlign = 'left' " Placement of aligned comment symbols
let NERDCommentEmptyLines = 1 " Empty lines will be commented as well
let NERDTrimTrailingWhitespace = 1 " Trailing whitespace will be deleted when uncommenting a line


" Since Alt style is not implemented at the moment, use custom delimiters instead.
let g:NERDCustomDelimiters = {
    \ 'haskell': { 'leftAlt': '{-','rightAlt': '-}', 'left': '--', 'right': '' },
    \ 'hspec': { 'leftAlt': '{-','rightAlt': '-}', 'left': '--', 'right': '' },
    \ 'c': { 'leftAlt': '/*','rightAlt': '*/', 'left': '//', 'right': '' },
\ }
]])

-- {{{1 NERDtree

vim.cmd([[
let NERDTreeQuitOnOpen = 1
]])

-- {{{1 null-ls

local null_ls = require("null-ls")

null_ls.setup({ sources = {
    -- null_ls.builtins.diagnostics.credo,
    null_ls.builtins.diagnostics.zsh,
    null_ls.builtins.formatting.erlfmt,
    null_ls.builtins.formatting.fnlfmt,
    null_ls.builtins.formatting.jq,
} })

-- {{{1 tagbar

vim.cmd([[
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }
]])

-- {{{1 taskwiki

vim.cmd([[
let g:taskwiki_sort_orders={"E": "end-"}
]])

-- {{{1 TextObjects

vim.cmd([[
" Default bindings disabled for remapping to Colemak bindings.
let g:textobj_rubyblock_no_default_key_mappings = 1
let g:textobj_indent_no_default_key_mappings = 1
let g:textobj_space_no_default_key_mappings = 1
let g:textobj_underscore_no_default_key_mappings = 1
let g:textobj_url_no_default_key_mappings = 1
]])

-- {{{1 Telescope

require('telescope').load_extension('fzf')

-- {{{1 unimpaired

vim.cmd([[
" The default mapping prefix 'yo' conflicts with my Colemak setup.
" The older prefix 'co' works better for me.
let g:nremap = {"y": "c"}
let g:xremap = {"y": "c"}
let g:oremap = {"y": "c"}
]])

-- {{{1 vimwiki

vim.cmd([[
let g:vimwiki_auto_chdir = 1
let g:vimwiki_list = [
  \{
    \ 'path': '~/vimwiki/',
    \ 'path_html': '~/stuff/vimwiki_html/',
    \ 'template_path': '~/vimwiki/templates',
    \ 'template_default': 'def_template',
    \ 'template_ext': '.html',
    \ 'syntax': 'markdown',
    \ 'ext': '.md',
    \ 'auto_tags': 1,
    \ 'auto_diary_index': 1
  \},
  \{
    \ 'path': '~/taskwiki/',
  \}
\]

" add the <pre> tag, for inserting code snippets
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script'
]])

-- {{{1 vista

vim.cmd([[
let g:vista_icon_indent = ["↳ ", "↦ "]
]])

-- {{{1 wheel

vim.cmd([[
" Disable for mouse, due to erratic behavior.
let g:wheel#map#mouse = 0
]])

-- {{{1 zettel

vim.cmd([[
let g:zettel_format = "z_%Y-%m-%d_%H%M"
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
]])
