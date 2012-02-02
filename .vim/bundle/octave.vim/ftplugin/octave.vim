" [octave.vim] ftplugin for GNU Octave
"
" Author: Johannes Ranke <jranke@uni-bremen.de>
" Adapted from r.vim, originally authored by
" Iago Mosqueira <i.mosqueira@ic.ac.uk>
" Last change: 28 Jul 2004 
"
" Code written in vim is sent to Octave through a perl pipe
" [funnel.pl, by Larry Clapp <vim@theclapp.org>], as individual lines,
" blocks, or the whole file.
"
" Usage:
"
" Start octave with:
"       xterm -T 'Octave' -e perl ~/.vim/ftplugin/funnel.pl ~/.o-pipe octave&
"
" Add to filetype.vim:
"   au BufNewFile,BufRead *.m     setf octave
"   au BufNewFile,BufRead *.m     set syntax=matlab
"
" In insert mode, <M-Enter> sends the active line to Octave and moves to the next
" line (write and process mode).
"
" Maps:
"       <F5>        Run current file
"       <F9>        Run line under cursor or visual block
"       r	        Run visual block
"       <M-Enter>   Write and process



" Only do this when not yet done for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

"disable backup for .o-pipe
setl backupskip=.*pipe

"set octave-friendly tabbing
set expandtab
set tabstop=4
set shiftwidth=4

"send line under cursor to Octave
noremap <buffer> <F9> :execute line(".") 'w >> ~/.o-pipe'<CR>
inoremap <buffer> <F9> <Esc> :execute line(".") 'w >> ~/.o-pipe'<CR>

"send visual selected block to Octave
vnoremap <buffer> r :w >> ~/.o-pipe<CR>

"write and process mode (somehow mapping <C-Enter> does not work for me)
inoremap <M-Enter> <Esc>:execute line(".") 'w >> ~/.o-pipe'<CR>o

"send current file to Octave
noremap <buffer> <F5> :execute '1 ,' line("$") 'w >> ~/.o-pipe' <CR><CR>
