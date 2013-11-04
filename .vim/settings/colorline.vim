" Only show cursorline in the current window and in normal mode.
augroup cline
	au!
	au WinLeave,InsertEnter * set nocursorline
	au WinEnter,InsertLeave * set cursorline
augroup END
