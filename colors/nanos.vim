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
hi! MatchParen guibg=#151515 guifg=#ff966c

" Diff
hi! DiffAdd gui=NONE guifg=NONE guibg=#00402A
hi! DiffChange gui=NONE guifg=NONE guibg=#402A00
hi! DiffDelete gui=NONE guifg=NONE guibg=#400000
hi! DiffText gui=NONE guifg=NONE guibg=#8CBEE2

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
hi! Pmenu gui=bold guifg=#c2c2c2 guibg=#2A2A2A " Popup menu font and Background
hi! PmenuSel guibg=black guifg=#65bcff " Popup menu selection highlight and text highlight when selected
hi! PmenuSbar guibg=Grey " Popup menu scroll background
hi! PmenuThumb guibg=#c2c2c2 " Popup menu scroll thing
hi! PmenuMatch guibg=NONE guifg=#65bcff
hi! PmenuKind guifg=#ffc777

" Tabline
hi! TabLine cterm=NONE ctermfg=15 ctermbg=242 gui=NONE guibg=#000000 guifg=#373737
hi! TabLineSel cterm=bold gui=bold guibg=lightblue guifg=#000000
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
hi! link @variable.vim @lsp.type.variable
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
hi! link @variable.python @lsp.type.variable
hi! @variable.member.python guifg=#4fd633
hi! @variable.parameter.python guifg=#ffc777
hi! @variable.builtin.python gui=italic guifg=#fca7ea

" Markdown
hi!  @markup.heading.1.markdown guifg=#65bcff
hi!  @markup.heading.2.markdown guifg=#4fd633
hi!  @markup.heading.3.markdown guifg=#ffc777
hi!  @markup.heading.4.markdown guifg=#fca7ea
hi!  RenderMarkdownCodeInline guibg=#222222
hi!  RenderMarkdownCode guibg=#222222

" nvim-cmp
hi! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
hi! CmpItemAbbrMatch guibg=NONE guifg=#65bcff
hi! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
hi! CmpItemKindVariable guibg=NONE guifg=#c8d3f5
hi! link CmpItemKindInterface CmpItemKindVariable
hi! link CmpItemKindText CmpItemKindVariable
hi! CmpItemKindFunction guibg=NONE guifg=#fca7ea
hi! link CmpItemKindMethod CmpItemKindFunction
hi! CmpItemKindKeyword guibg=NONE guifg=#4fd633
hi! link CmpItemKindProperty CmpItemKindKeyword
hi! link CmpItemKindUnit CmpItemKindKeyword

