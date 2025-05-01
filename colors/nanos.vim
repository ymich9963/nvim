hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "nanos"

set termguicolors

" Generic
" hi! Menu font= guibg= guifg=
" hi! Scrollbar font= guibg= guifg=
" hi! Tooltip font= guibg= guifg=
hi! Normal guifg=#eeeeee guibg=#000000  " Background
hi! Function guifg=#2d52d6 
hi! Type guifg=#65bcff
" hi! Identifier guifg=#9d33ff
hi! Special guifg=#65bcff
hi! Statement guifg=#9d33ff
hi! Constant guifg=#ff966c
hi! Comment guifg=#999999
hi! Keywords guifg=#9d33ff
hi! PreProc guifg=#86e1fc 
hi! String guifg=#e2eb56
hi! EndOfBuffer guifg=#000000 " Dashes at end of file
hi! WarningMsg guifg=#ffc777
hi! Title ctermfg=NONE gui=bold guifg=#222222
hi! Visual ctermbg=NONE guibg=#2A2A2A
hi! CursorLine guifg=NONE guibg=#151515
hi! MatchParen guibg=#000000 guifg=#ff966c

" Folding
hi! Folded guibg=#000000 gui=bold,italic

" Status line
hi! StatusLine cterm=NONE gui=bold,italic guifg=#eeeeee guibg=#000001
hi! StatusLineNC cterm=NONE gui=bold,italic guifg=#eeeeee guibg=#000000

" Line numbers side
hi! LineNr guifg=#535561
hi! CursorLineNr guifg=#8c8c8c
hi! SignColumn guifg=#535561 guibg=#000000

" Popup menu
hi! Pmenu guifg=#8c8c8c guibg=#111111 " Popup menu font and Background
hi! PmenuSel ctermfg=242 ctermbg=0 guibg=#bbbbbb " Popup menu selection highlight
hi! PmenuSbar ctermbg=248 guibg=Grey " Popup menu scroll background
hi! PmenuThumb ctermbg=15 guibg=#c2c2c2 " Popup menu scroll thing

" Tabline
hi! TabLine cterm=NONE ctermfg=15 ctermbg=242 gui=NONE guibg=#000000 guifg=#373737
hi! TabLineSel cterm=bold gui=bold guibg=lightblue guifg=#000000
" hi! TabLineSel cterm=bold gui=bold guibg=#274134
hi! TabLineFill cterm=NONE gui=NONE " Fill between the tabs

" Tree-sitter
hi! @operator guifg=#89ddff 
hi! @punctuation guifg=#535561 " Brackets
hi! @punctuation.special guifg=#773c3c " Exclamation marks

" LSP
hi! @lsp.type.variable guifg=#c8d3f5
hi! @lsp.type.parameter guifg=#ffc777
hi! @lsp.type.property guifg=#4fd633
hi! @lsp.typemod.function.defaultLibrary guifg=#65bcff

" Vimscript
hi! @keyword.vim cterm=italic gui=italic guifg=#fca7ea 
hi! @property.vim guifg=#4fd633 
hi! @variable.vim guifg=#c8d3f5
hi! @markup.heading guifg=Grey

" Indent backline
hi! IblIndent guifg=#535561

" Oil
" for column colours change in plugin config, look at docs
hi! OilDirHidden guifg=#09908f 
hi! OilFileHidden guifg=#09908f 

" C/Cpp
hi! @keyword.type.cpp guifg=lightblue
" hi! @@comment.documentation.cpp guifg=#65bcff

" Python
hi! @variable.python guifg=#c8d3f5 
hi! @variable.member.python guifg=#4fd633
hi! @variable.parameter.python guifg=#ffc777
hi! @variable.builtin.python gui=italic guifg=#fca7ea

" Makrdown
hi!  @markup.heading.1.markdown guifg=#65bcff
hi!  @markup.heading.2.markdown guifg=#4fd633
hi!  @markup.heading.3.markdown guifg=#ffc777
hi!  @markup.heading.4.markdown guifg=#fca7ea
" could use markdownH1/2/3/4 before, not sure what happened.

