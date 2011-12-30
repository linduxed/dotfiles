" Vim color file
" Maintainer: linduxed

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
set t_Co=256
let g:colors_name="linduxed"

let python_highlight_all = 1
let c_gnu = 1

augroup Syntax_extensions
    au!
    au Syntax c,cpp,ruby,javascript syn match Operator "[*/%&|!=><^~,.;:?+-]\+" display contains=TOP
    au Syntax c,cpp syn region cParen matchgroup=Operator transparent start='(' end=')' contains=ALLBUT,@cParenGroup,cCppParen,cErrInBracket,cCppBracket,cCppString,@Spell
    au Syntax c,cpp syn region cCppParen matchgroup=Operator transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cParenGroup,cErrInBracket,cParen,cBracket,cString,@Spell
    au Syntax c,cpp syn region cBracket matchgroup=Operator transparent start='\[\|<::\@!' end=']\|:>' contains=ALLBUT,@cParenGroup,cErrInParen,cCppParen,cCppBracket,cCppString,@Spell
    au Syntax c,cpp syn region cCppBracket matchgroup=Operator transparent start='\[\|<::\@!' skip='\\$' excludenl end=']\|:>' end='$' contained contains=ALLBUT,@cParenGroup,cErrInParen,cParen,cBracket,cString,@Spell
    au Syntax c,cpp syn region cBlock matchgroup=OperatorCurlyBrackets start="{" end="}" transparent fold
    au Syntax ruby syn match rubyBlockParameter "\%(\%(\<do\>\|{\)\s*\)\@<=|\s*[( ,a-zA-Z0-9_*)]\+\ze\s*|"hs=s+1 display
    au Syntax ruby syn region rubyCurlyBlock matchgroup=Operator start="{" end="}" contains=ALLBUT,@rubyExtendedStringSpecial,rubyTodo fold
    au Syntax ruby syn region rubyParentheses matchgroup=Operator start="(" end=")" contains=ALLBUT,@rubyExtendedStringSpecial,rubyTodo
    au Syntax ruby syn region rubySquareBrackets matchgroup=Operator start="\[" end="\]" contains=ALLBUT,@rubyExtendedStringSpecial,rubyTodo
    au Syntax javascript syn region javascriptCurlyBrackets matchgroup=Operator start="{" end="}" transparent fold
    au Syntax javascript syn region javascriptParentheses matchgroup=Operator start="(" end=")" transparent
    au Syntax javascript syn region javascriptSquareBrackets matchgroup=Operator start="\[" end="\]" transparent
augroup END

set statusline=%<%1*===\ %5*%f%1*%(\ ===\ %4*%h%1*%)%(\ ===\ %4*%m%1*%)%(\ ===\ %4*%r%1*%)\ ===%====\ %2*%b(0x%B)%1*\ ===\ %3*%l,%c%V%1*\ ===\ %5*%P%1*\ ===%0* laststatus=2


hi Normal		ctermfg=255		ctermbg=none	cterm=none
hi Directory	ctermfg=75		ctermbg=none	cterm=bold
hi ErrorMsg		ctermfg=160		ctermbg=0		cterm=bold
hi PreProc		ctermfg=45		ctermbg=none	cterm=bold
hi Search		ctermfg=17		ctermbg=252		cterm=bold
hi Type			ctermfg=141		ctermbg=none	cterm=bold
hi Statement	ctermfg=208		ctermbg=none	cterm=bold
hi Comment		ctermfg=241		ctermbg=none	cterm=none
hi LineNr		ctermfg=244		ctermbg=233		cterm=none
hi DiffText		ctermfg=165		ctermbg=244		cterm=none
hi Constant		ctermfg=76		ctermbg=none	cterm=none
hi Todo			ctermfg=163		ctermbg=235		cterm=bold
hi Identifier	ctermfg=226		ctermbg=none	cterm=bold
hi Error		ctermfg=none	ctermbg=196		cterm=bold
hi Special		ctermfg=196		ctermbg=none	cterm=bold
hi Ignore		ctermfg=221		ctermbg=none	cterm=bold
hi Underline	ctermfg=147		ctermbg=none	cterm=italic
hi String		ctermfg=43		ctermbg=none	cterm=none
hi Character	ctermfg=215		ctermbg=none	cterm=none
hi Number		ctermfg=118		ctermbg=none	cterm=none
hi FoldColumn	ctermfg=104		ctermbg=none	cterm=none
hi Folded		ctermfg=104		ctermbg=none	cterm=bold
hi Visual		ctermfg=none	ctermbg=238		cterm=none
hi Title		ctermfg=159		ctermbg=none	cterm=none

" Completion menu
hi Pmenu		ctermfg=69		ctermbg=235		cterm=none
hi PmenuSel		ctermfg=79		ctermbg=232		cterm=bold
hi PmenuSbar	ctermfg=247		ctermbg=235		cterm=bold
hi PmenuThumb	ctermfg=248		ctermbg=235		cterm=none

" Chrome
hi StatusLineNC ctermfg=248		ctermbg=239		cterm=none
hi StatusLine	ctermfg=39		ctermbg=239		cterm=none
hi VertSplit	ctermfg=239		ctermbg=239		cterm=none
hi User1		cterm=bold		ctermbg=236		ctermfg=223
hi User2		cterm=none		ctermbg=236		ctermfg=240

" Tabs
hi TabLine		ctermfg=245		ctermbg=239		cterm=none
hi TabLineFill	ctermfg=239		ctermbg=239
hi TabLineSel	ctermfg=104		ctermbg=236		cterm=bold

" Cursor
hi Cursor		ctermfg=255		ctermbg=57		cterm=none
hi CursorLine	ctermfg=none	ctermbg=234		cterm=none
hi CursorColumn	ctermfg=none	ctermbg=234		term=reverse

" Invisible characters
hi SpecialKey	ctermfg=102		ctermbg=none	cterm=none
hi NonText		ctermfg=104		ctermbg=none	cterm=bold

" MiniBufExpl Colors
hi MBEVisibleActive			ctermfg=154		ctermbg=none	cterm=bold
hi MBEVisibleChangedActive	ctermfg=124		ctermbg=none	cterm=bold
hi MBEVisibleChanged		ctermfg=124		ctermbg=none	cterm=bold
hi MBEVisibleNormal			ctermfg=45		ctermbg=none	cterm=bold
hi MBEChanged				ctermfg=208		ctermbg=none	cterm=bold
hi MBENormal				ctermfg=244		ctermbg=none	cterm=bold

