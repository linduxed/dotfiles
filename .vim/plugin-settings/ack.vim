" Use Silver Searcher if present on the system.
if executable("ag")
	let g:ackprg = 'ag --nogroup --nocolor --column'
endif
