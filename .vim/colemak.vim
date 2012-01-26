" Redesigned mapping for the Colemak layout for Vim 7.0
" 2008-04-21 Shai Coleman, http://colemak.com/ . Public domain. 
" Edited by linduxed.
"
" TODO: Fix "change inner" like "ciw". Probably caused by i being right.
"
" Colemak layout:                  |                 QWERTY layout:
" `12345 67890-=     Move Around:  |  (instead of)   `12345 67890-=
"  qwfpg jlUy;[]\         u        |       k          qwert yuiop[]\
"  arstd hNEIo'         n   i      |     h   l        asdfg HJKL;'
"  zxcvb km,./            e        |       j          zxcvb nm,./
" 
" (nv  )     n =Left       ,     i =Right   ,    u =Up    ,     e =Down      
" (nv  )     N =Left*5     ,     I =Right*5 ,    U =Up*5  ,     E =Down*5    
" (nv  )    l =Left 1 word ,     y =Right 1 word
" (nv  ) <C-l>=Left 1 WORD ,  <C-y>=Right 1 WORD
" (nv  )    L =Home        ,     Y =End                   
" (nv  )    j =PageUp      ,     h =PageDown              
" (nvi )         <Tab>=Escape  (also stops search highlight in normal mode)
" (   c)       <S-Tab>=Escape
" (nvi )       <S-Tab>=Tab
" (nvic)       <Space>=Space
" Legend:
" S - Shift, C - Ctrl
" (c - command line, i - insert mode, n - normal mode, v - visual+select mode)
"
if v:version < 700 | echohl WarningMsg | echo "colemak.vim: You need Vim version 7.0 or later" | echohl None | finish | endif

" Added the 'g' in front of 'j' and 'k' for visual line navigation.
" Up/down/left/right
nnoremap n h|xnoremap n h|onoremap n h|
nnoremap u gk|xnoremap u k|onoremap u k|
nnoremap e gj|xnoremap e j|onoremap e j|
nnoremap i l|xnoremap i l|onoremap i l|

" Added the 'g' in front of 'j' and 'k' for visual line navigation.
nnoremap <silent> N 5h|xnoremap <silent> N 5h|onoremap N 5h|
nnoremap <silent> U 5gk|xnoremap <silent> U 5gk|onoremap U 5gk|
nnoremap <silent> E 5gj|xnoremap <silent> E 5gj|onoremap E 5gj|
nnoremap <silent> I 5l|xnoremap <silent> I 5l|onoremap I 5l|

" Home/end of line
" 0 unchanged
nnoremap L ^|xnoremap L ^|onoremap L ^|
nnoremap Y $|xnoremap Y $|onoremap Y $|

" PageUp/PageDown
nnoremap <silent> <expr> j (winheight(0)-1) . "\<C-u>"
nnoremap <silent> <expr> h (winheight(0)-1) . "\<C-d>"
xnoremap <silent> <expr> j (winheight(0)-1) . "\<C-u>"
xnoremap <silent> <expr> h (winheight(0)-1) . "\<C-d>"
nnoremap <silent> <expr> <PageUp> (winheight(0)-1) . "\<C-u>"
nnoremap <silent> <expr> <PageDown> (winheight(0)-1) . "\<C-d>"
vnoremap <silent> <expr> <PageUp> (winheight(0)-1) . "\<C-u>"
vnoremap <silent> <expr> <PageDown> (winheight(0)-1) . "\<C-d>"
vnoremap <silent> <expr> <S-PageUp> (winheight(0)-1) . "\<C-u>"
vnoremap <silent> <expr> <S-PageDown> (winheight(0)-1) . "\<C-d>"

" Half page up/down
nnoremap <silent> <expr> <C-u> (winheight(0)/2) . "\<C-u>"
nnoremap <silent> <expr> <C-e> (winheight(0)/2) . "\<C-d>"
vnoremap <silent> <expr> <C-u> (winheight(0)/2) . "\<C-u>"
vnoremap <silent> <expr> <C-e> (winheight(0)/2) . "\<C-d>"

" Words forwards/backwards
nnoremap l b|xnoremap l b|onoremap l b|
nnoremap y w|xnoremap y w|onoremap y w|
" WORD left/right
nnoremap <C-l> B|vnoremap <C-l> B|onoremap <C-l> B|
nnoremap <C-y> W|vnoremap <C-y> W|onoremap <C-y> W|

" inneR text objects
" e.g. dip (delete inner paragraph) is now drp
onoremap r i

" Folds, etc.
nnoremap b z|xnoremap b z|
nnoremap bu zk|xnoremap bu zk|
nnoremap be zj|xnoremap be zj|

" Map ; to :
nnoremap ; :|xnoremap ; :|

" Cut/copy/paste
nnoremap x x|xnoremap x d|
nnoremap c y|xnoremap c y|
nnoremap v gP|xnoremap v gP|
nnoremap X dd|xnoremap X d|
nnoremap C yy|xnoremap C y|
nnoremap V p|xnoremap V p|
nnoremap <C-c> "+Y| " <C-c> with no selection copies current line to clipboard
nnoremap <C-x> "+dd| " <C-x> with no selection cuts current line to clipboard

" Undo/redo
nnoremap z u|xnoremap z :<C-u>undo<CR>|
nnoremap gz U|xnoremap gz U<C-u>undo<CR>|
nnoremap Z <C-r>|xnoremap Z :<C-u>redo<CR>|

" Navigate help file
" Use < and > to navigate in the help file instead
au FileType help nnoremap <buffer> < <C-t>|
au FileType help nnoremap <buffer> > <C-]>|
au FileType help nnoremap <buffer> <CR> <C-]>|
au FileType help nnoremap <buffer> <Backspace> <C-t>|
au FileType help nnoremap <buffer> <silent> <expr> <Space> (winheight(0)-1) . "\<C-d>0"|
au FileType help nnoremap <buffer> <silent> <expr> <S-Space> (winheight(0)-1) . "\<C-u>0"|"

" inSert/Replace/append (T)
nnoremap s i|
nnoremap S I|
nnoremap t a|
nnoremap T A|

" Change
nnoremap w c|xnoremap w c|
nnoremap W C|xnoremap W C|
nnoremap ww cc|

" Visual mode
nnoremap a v|xnoremap a v|
nnoremap A V|xnoremap A V|

" Search
nnoremap k n|xnoremap k n|onoremap k n|
nnoremap K N|xnoremap K N|onoremap K N|
 
" Breaks diffput
nnoremap p t|xnoremap p t|onoremap p t|
nnoremap P T|xnoremap P T|onoremap P T|

" Macros (replay the macro recorded by qq)
nnoremap Q @q|

" Misc overridden keys must be prefixed with g
nnoremap gs s|xnoremap gs s|
nnoremap gX X|xnoremap gX X|
nnoremap gU U|xnoremap gU U|
nnoremap gQ Q|xnoremap gQ Q|
nnoremap gK K|xnoremap gK K|
" extra alias
nnoremap gh K|xnoremap gh K| 

" Window navigation
nnoremap <C-w>n <C-w>h|xnoremap <C-w>n <C-w>h| 
nnoremap <C-w>u <C-w>k|xnoremap <C-w>u <C-w>k| 
nnoremap <C-w>e <C-w>j|xnoremap <C-w>e <C-w>j| 
nnoremap <C-w>i <C-w>l|xnoremap <C-w>i <C-w>l| 
nnoremap <C-w>N <C-w>H|xnoremap <C-w>n <C-w>h| 
nnoremap <C-w>U <C-w>K|xnoremap <C-w>u <C-w>k| 
nnoremap <C-w>E <C-w>J|xnoremap <C-w>e <C-w>j| 
nnoremap <C-w>I <C-w>L|xnoremap <C-w>i <C-w>l| 

nnoremap <Space> i<Space><Esc><Right>|
xnoremap <silent> <Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv><CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>
xnoremap <silent> <S-Space> :<C-u>let b:tmp_var=&sw\|set sw=1\|normal! gv<<CR>:<C-u>let &sw=b:tmp_var\|normal! gv<CR>

" The Tab key is mapped to Escape. Press Shift-Tab to insert a Tab.
" To minimize Tab use, you can use '<', '>' and ':set autoindent'
nnoremap <silent> <Tab> <Esc>:nohlsearch<bar>pclose<CR>|
vnoremap <Tab> <Esc><Nul>| " <Nul> added to fix select mode problem
inoremap <Tab> <Esc>|
nnoremap <S-Tab> i<Tab><Esc><Right>
vnoremap <S-Tab> >gv|
inoremap <S-Tab> <Tab>|

" Enter, open line
nnoremap <CR> i<CR><Esc>|
inoremap <S-CR> <CR>|
nnoremap <S-CR> O<Esc>|
nnoremap <C-CR> o<Esc>|inoremap <C-CR> <C-o>o|

" Delete/Backspace
nnoremap <C-d> "_dw|vnoremap <C-d> "_d|inoremap <C-d> <Delete>|cnoremap <C-d> <Delete>|
nnoremap <Delete> "_x|vnoremap <Delete> "_d|
nnoremap <Backspace> a<Left><Backspace><Right><Esc>|vnoremap <Backspace> "_d|

"Tip #1386, Make Vim completion popup menu work just like in an IDE
inoremap <expr> <C-n> pumvisible() ? "\<lt>C-n>" : "\<lt>C-n>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
inoremap <expr> <M-;> pumvisible() ? "\<lt>C-n>" : "\<lt>C-x>\<lt>C-o>\<lt>C-n>\<lt>C-p>\<lt>C-r>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
