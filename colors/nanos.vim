hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "nanos"

set termguicolors

" Generic
hi! Normal guifg=#eeeeee guibg=#14161b  " Background
hi! Function guifg=#2d52d6 
hi! Type guifg=#65bcff
hi! Special guifg=#65bcff
hi! Statement guifg=#9d33ff
hi! Constant guifg=#ff966c
hi! Comment guifg=#999999
hi! Keywords guifg=#9d33ff
hi! PreProc guifg=#86e1fc 
hi! String guifg=#e2eb56
hi! EndOfBuffer guifg=#14161b " Dashes at end of file
hi! WarningMsg guifg=#ffc777
hi! Title ctermfg=NONE gui=bold guifg=#eeeeee
hi! Visual ctermbg=NONE guibg=#3c3c3c
hi! CursorLine guifg=NONE guibg=#000000
hi! MatchParen guibg=#151515 guifg=#ff966c
hi! WinSeparator guifg=#eeeeee

" Diff
hi! DiffAdd gui=NONE guifg=NONE guibg=#00402a
hi! DiffChange gui=NONE guifg=NONE guibg=#402a00
hi! DiffDelete gui=NONE guifg=NONE guibg=#400000
hi! DiffText gui=NONE guifg=NONE guibg=#8cbee2

" Folding
hi! Folded guibg=#14161b gui=bold,italic

" Status line
hi! StatusLine cterm=NONE gui=bold,italic guifg=#000000 guibg=#eeeeee
hi! StatusLineNC cterm=NONE gui=bold guifg=#eeeeee guibg=#14161b

" Line numbers side
hi! LineNr guifg=#535561
hi! CursorLineNr guifg=#8c8c8c
hi! SignColumn guifg=#535561 guibg=#14161b

" Popup menu
hi! Pmenu gui=bold guifg=#c2c2c2 guibg=#3c3c3c " Popup menu font and Background
hi! PmenuSel guibg=black guifg=#65bcff " Popup menu selection highlight and text highlight when selected
hi! PmenuSbar guibg=Grey " Popup menu scroll background
hi! PmenuThumb guibg=#c2c2c2 " Popup menu scroll thing
hi! PmenuMatch guibg=NONE guifg=#65bcff
hi! PmenuKind guifg=#ffc777

" Tabline
hi! TabLine cterm=NONE ctermfg=15 ctermbg=242 gui=NONE guibg=#14161b guifg=#373737
hi! TabLineSel cterm=bold gui=bold guibg=lightblue guifg=#14161b
hi! TabLineFill cterm=NONE gui=NONE " Fill between the tabs

" Special Comments
hi! TODO guibg=NvimLightCyan guifg=Black
hi! INFO guibg=NvimLightBlue guifg=Black
hi! FIX guibg=NvimLightYellow guifg=Black
hi! BUG guibg=NvimLightRed guifg=Black

" Make the matches for the SpecialComments at every window
augroup SpecialComments
    autocmd WinEnter * call matchadd("TODO", 'TODO:')
    autocmd WinEnter * call matchadd("INFO", 'INFO:')
    autocmd WinEnter * call matchadd("FIX", 'FIX:')
    autocmd WinEnter * call matchadd("BUG", 'BUG:')
augroup END

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

" C/Cpp
hi! @keyword.type.cpp guifg=lightblue

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

" Indent backline
hi! IblIndent guifg=#535561

" Oil
" for column colours change in plugin config, look at docs
hi! OilDirHidden guifg=#09908f 
hi! OilFileHidden guifg=#09908f 

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

