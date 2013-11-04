let NERDSpaceDelims = 1 " Add spaces around the comment signs for all languages
" Since Alt style is not implemented at the moment, use custom delimiters instead.
let g:NERDCustomDelimiters = {
	\ 'haskell': { 'leftAlt': '{-','rightAlt': '-}', 'left': '--', 'right': '' },
	\ 'hspec': { 'leftAlt': '{-','rightAlt': '-}', 'left': '--', 'right': '' },
	\ 'c': { 'leftAlt': '/*','rightAlt': '*/', 'left': '//', 'right': '' },
\ }
