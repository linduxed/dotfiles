let g:ctrlp_max_height = 25
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp-cache'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_multi = '2v'
let g:ctrlp_custom_ignore = { 'dir': 'tmp' }

" Make CtrlP use ag (if it is present) for listing the files.
if executable("ag")
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
