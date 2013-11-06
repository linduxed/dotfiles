" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
filetype indent plugin on

" {{{1 Colorscheme

syntax on
set background=dark

if !has('gui_running')
    set t_Co=256
    let g:solarized_termcolors=256
endif

let g:solarized_termtrans  = 1
let g:solarized_degrade    = 0
let g:solarized_bold       = 1
let g:solarized_underline  = 1
let g:solarized_italic     = 1
let g:solarized_contrast   = "normal"
let g:solarized_visibility = "normal"

colorscheme solar_linduxed

" Load settings
source ~/.vim/colemak.vim
source ~/.vim/settings/miscellaneous.vim
source ~/.vim/settings/syntax_coloring.vim
source ~/.vim/settings/foldtext.vim
source ~/.vim/settings/wildmenu.vim
source ~/.vim/settings/viminfo.vim
source ~/.vim/settings/backups.vim
source ~/.vim/plugin-settings/rainbow_parentheses.vim
source ~/.vim/plugin-settings/ctrlp.vim
source ~/.vim/plugin-settings/snipmate.vim
source ~/.vim/plugin-settings/nerd_commenter.vim
source ~/.vim/plugin-settings/gist.vim
source ~/.vim/plugin-settings/ack.vim
source ~/.vim/plugin-settings/syntastic.vim
source ~/.vim/plugin-settings/indent_guides.vim
source ~/.vim/plugin-settings/rspec.vim
source ~/.vim/plugin-settings/text_objects.vim
source ~/.vim/plugin-settings/airline.vim
source ~/.vim/plugin-settings/delimitmate.vim
source ~/.vim/plugin-settings/markdown.vim
source ~/.vim/autocommands/filetype_dependant.vim
source ~/.vim/autocommands/restore_cursor_position.vim
source ~/.vim/autocommands/misc.vim
source ~/.vim/mappings/trailing_whitespace.vim
source ~/.vim/mappings/highlight_whitespace.vim
source ~/.vim/mappings/visual_search.vim
source ~/.vim/mappings/search_and_jump.vim
source ~/.vim/mappings/selection_and_folds.vim
source ~/.vim/mappings/function_keys.vim
source ~/.vim/mappings/completion_menu.vim
source ~/.vim/mappings/misc.vim
source ~/.vim/mappings/fixed_width_formatting.vim
source ~/.vim/mappings/layout_switching.vim
source ~/.vim/mappings/tab_switching.vim
source ~/.vim/plugin-mappings/easymotion.vim
source ~/.vim/plugin-mappings/ctrlp.vim
source ~/.vim/plugin-mappings/snipmate.vim
source ~/.vim/plugin-mappings/tabular.vim
source ~/.vim/plugin-mappings/indent_guides.vim
source ~/.vim/plugin-mappings/rspec.vim
source ~/.vim/plugin-mappings/text_objects.vim
