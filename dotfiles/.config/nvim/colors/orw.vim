let colors_name = "orw"

set background=dark

hi clear

let s:da = '#A3BE8C'
let s:da = '#c6ca67'
let s:dd = '#BF616A'
let s:dd = '#a66c6c'
let s:dc = '#EBCB8B'

let g:bg = 'none'
let g:fg = '#d0d0d0'
let g:ifg = '#858585'
let g:vfg = '#959595'
let g:cfg = '#c0c0c0'
let g:ffg = '#efd191'
let g:sfg = '#7d7566'
let s:nbg = '#3e3e3d'
let s:nfg = '#B1AB7C'
let g:lbg = '#393938'
let g:lfg = '#656565'
let g:lsbg = '#505050'
let g:lsfg = '#999999'
let g:syfg = '#c0c0c0'
let g:slbg = '#393939'
let g:slfg = '#777777'

let g:bcbg = '#959595'
let g:bdbg = '#606060'

let g:nmbg = '#e3c28d'
"let g:nmbg = '#e3c28d'
"let g:nmbg = '#9191B8'
let g:nmbg = '#8787af'
let g:imbg = '#a2b36d'
let g:vmbg = '#ce866b'

exe 'hi Error          guibg=none'
exe 'hi MoreMsg        guifg='.g:sfg
exe 'hi ErrorMsg       guibg=none                 guifg='.g:ffg
exe 'hi Visual         guibg='.g:lsbg
exe 'hi Normal         guifg='.g:fg             .' guibg='.g:bg
exe 'hi Underlined     guifg='.g:fg
exe 'hi NonText        guifg='.g:lsbg
exe 'hi SpecialKey     guifg='.g:lfg            .' guibg='.g:lbg

exe 'hi LineNr         guifg='.g:lfg            .' guibg='.s:nbg
exe 'hi StatusLine     guifg='.g:lfg            .' guibg='.g:lbg            .' gui=none'
exe 'hi StatusLineNC   guifg='.g:cfg            .' guibg='.g:lbg            .' gui=none'
exe 'hi VertSplit      guifg='.g:lbg            .' guibg='.g:lbg            .' gui=none'

exe 'hi Pmenu          guifg='.g:lfg            .' guibg='.g:lbg
exe 'hi PmenuSel       guifg='.g:lsfg           .' guibg='.g:lsbg
exe 'hi WildMenu       guifg='.g:lsfg           .' guibg='.g:lsbg

exe 'hi TabLine        guifg='.g:lfg            .' guibg='.g:lbg            .' gui=none'
exe 'hi TabLineSel     guifg='.g:lsfg           .' guibg='.g:lbg           .' gui=none'
exe 'hi TabLineFill    guifg='.g:lfg            .' guibg='.g:lbg            .' gui=none'

exe 'hi MatchParen     guifg='.g:fg             .' guibg='.g:lfg

exe 'hi Folded         guifg='.g:lsfg            ' guibg='.g:lsbg            .' gui=none'
exe 'hi FoldColumn     guifg='.g:lsfg            ' guibg='.g:lsbg            .' gui=none'
exe 'hi SignColumn     guifg='.g:lsfg            ' guibg='.g:lsbg            .' gui=none'

exe 'hi Comment        guifg='.g:lsbg
exe 'hi TODO           guifg='.g:vfg

exe 'hi Title          guifg='.g:cfg

exe 'hi Constant       guifg='.g:ffg             .' gui=none'
exe 'hi String         guifg='.g:sfg             .' gui=none'
exe 'hi Delimiter      guifg='.g:cfg             .' gui=none'
exe 'hi Special        guifg='.g:cfg             .' gui=none'

exe 'hi Function       guifg='.g:ffg             .' gui=none'
exe 'hi Directory      guifg='.g:ffg             .' gui=none'

exe 'hi Identifier     guifg='.g:ifg             .' gui=none'
exe 'hi Statement      guifg='.g:syfg            .' gui=none'
exe 'hi Conditional    guifg='.g:syfg            .' gui=none'
exe 'hi Repeat         guifg='.g:syfg            .' gui=none'
exe 'hi Structure      guifg='.g:syfg            .' gui=none'

exe 'hi PreProc        guifg='.g:vfg             .' gui=none'
exe 'hi Operator       guifg='.g:fg              .' gui=none'
exe 'hi Type           guifg='.g:syfg            .' gui=none'
exe 'hi Typedef        guifg='.g:syfg            .' gui=none'

exe 'hi DiffAdd        guifg='.s:da              .' guibg='.g:lsbg
exe 'hi DiffText       guifg='.s:dc              .' guibg='.g:lsbg
exe 'hi DiffChange                                  guibg='.g:lsbg
exe 'hi DiffDelete     guifg='.s:dd              .' guibg='.g:lsbg

exe 'hi CursorLine     guibg='.g:lbg             .' gui=none'
exe 'hi CursorLineNr   guifg='.s:nfg             .' guibg='.g:lbg

set cursorline
