" Vim color file
" Converted from Textmate theme FLN Default using Coloration v0.2.5 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "FLN Default"

hi Cursor  guifg=NONE guibg=#fff831 gui=NONE
hi Visual  guifg=NONE guibg=#976218 gui=NONE
hi CursorLine  guifg=NONE guibg=#3f3e0d gui=NONE
hi CursorColumn  guifg=NONE guibg=#3f3e0d gui=NONE
hi LineNr  guifg=#808080 guibg=#000000 gui=NONE
hi VertSplit  guifg=#303030 guibg=#303030 gui=NONE
hi MatchParen  guifg=#5eb1c5 guibg=NONE gui=NONE
hi StatusLine  guifg=#ffffff guibg=#303030 gui=bold
hi StatusLineNC  guifg=#ffffff guibg=#303030 gui=NONE
hi Pmenu  guifg=NONE guibg=NONE gui=NONE
hi PmenuSel  guifg=NONE guibg=#976218 gui=NONE
hi IncSearch  guifg=NONE guibg=#534725 gui=NONE
hi Search  guifg=NONE guibg=#534725 gui=NONE
hi Directory  guifg=#d4584a guibg=NONE gui=NONE
hi Folded  guifg=#5a8efa guibg=#000000 gui=NONE

hi Normal  guifg=#ffffff guibg=#000000 gui=NONE
hi Boolean  guifg=#de001c guibg=NONE gui=bold,italic
hi Character  guifg=#d4584a guibg=NONE gui=NONE
hi Comment  guifg=#5a8efa guibg=NONE gui=italic
hi Conditional  guifg=#5eb1c5 guibg=NONE gui=NONE
hi Constant  guifg=#d4584a guibg=NONE gui=NONE
hi Define  guifg=#5eb1c5 guibg=NONE gui=NONE
hi ErrorMsg  guifg=NONE guibg=NONE gui=NONE
hi WarningMsg  guifg=NONE guibg=NONE gui=NONE
hi Float  guifg=#747de3 guibg=NONE gui=NONE
hi Function  guifg=NONE guibg=NONE gui=NONE
hi Identifier  guifg=#ffffff guibg=NONE gui=bold
hi Keyword  guifg=#5eb1c5 guibg=NONE gui=NONE
hi Label  guifg=#a57a4a guibg=NONE gui=NONE
hi NonText  guifg=#434343 guibg=#3f3e0d gui=NONE
hi Number  guifg=#747de3 guibg=NONE gui=NONE
hi Operator  guifg=#5eb1c5 guibg=NONE gui=NONE
hi PreProc  guifg=#5eb1c5 guibg=NONE gui=NONE
hi Special  guifg=#ffffff guibg=NONE gui=NONE
hi SpecialKey  guifg=#434343 guibg=#3f3e0d gui=NONE
hi Statement  guifg=#5eb1c5 guibg=NONE gui=NONE
hi StorageClass  guifg=#ffffff guibg=NONE gui=bold
hi String  guifg=#a57a4a guibg=NONE gui=NONE
hi Tag  guifg=#80ceff guibg=NONE gui=bold
hi Title  guifg=#ffffff guibg=NONE gui=bold
hi Todo  guifg=#5a8efa guibg=NONE gui=inverse,bold,italic
hi Type  guifg=NONE guibg=NONE gui=NONE
hi Underlined  guifg=NONE guibg=NONE gui=underline
hi rubyClass  guifg=#5eb1c5 guibg=NONE gui=NONE
hi rubyFunction  guifg=NONE guibg=NONE gui=NONE
hi rubyInterpolationDelimiter  guifg=NONE guibg=NONE gui=NONE
hi rubySymbol  guifg=#d4584a guibg=NONE gui=NONE
hi rubyConstant  guifg=NONE guibg=NONE gui=NONE
hi rubyStringDelimiter  guifg=#a57a4a guibg=NONE gui=NONE
hi rubyBlockParameter  guifg=#fad670 guibg=NONE gui=NONE
hi rubyInstanceVariable  guifg=#fad670 guibg=NONE gui=NONE
hi rubyInclude  guifg=#5eb1c5 guibg=NONE gui=NONE
hi rubyGlobalVariable  guifg=#fad670 guibg=NONE gui=NONE
hi rubyRegexp  guifg=#cccc33 guibg=NONE gui=NONE
hi rubyRegexpDelimiter  guifg=#cccc33 guibg=NONE gui=NONE
hi rubyEscape  guifg=#d4584a guibg=NONE gui=NONE
hi rubyControl  guifg=#5eb1c5 guibg=NONE gui=NONE
hi rubyClassVariable  guifg=#fad670 guibg=NONE gui=NONE
hi rubyOperator  guifg=#5eb1c5 guibg=NONE gui=NONE
hi rubyException  guifg=#5eb1c5 guibg=NONE gui=NONE
hi rubyPseudoVariable  guifg=#fad670 guibg=NONE gui=NONE
hi rubyRailsUserClass  guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod  guifg=#6b7fd5 guibg=NONE gui=underline
hi rubyRailsARMethod  guifg=#6b7fd5 guibg=NONE gui=underline
hi rubyRailsRenderMethod  guifg=#6b7fd5 guibg=NONE gui=underline
hi rubyRailsMethod  guifg=#6b7fd5 guibg=NONE gui=underline
hi erubyDelimiter  guifg=NONE guibg=NONE gui=NONE
hi erubyComment  guifg=#5a8efa guibg=NONE gui=italic
hi erubyRailsMethod  guifg=#6b7fd5 guibg=NONE gui=underline
hi htmlTag  guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag  guifg=NONE guibg=NONE gui=NONE
hi htmlTagName  guifg=NONE guibg=NONE gui=NONE
hi htmlArg  guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar  guifg=#d4584a guibg=NONE gui=NONE
hi javaScriptFunction  guifg=#ffffff guibg=NONE gui=bold
hi javaScriptRailsFunction  guifg=#6b7fd5 guibg=NONE gui=underline
hi javaScriptBraces  guifg=NONE guibg=NONE gui=NONE
hi yamlKey  guifg=#80ceff guibg=NONE gui=bold
hi yamlAnchor  guifg=#fad670 guibg=NONE gui=NONE
hi yamlAlias  guifg=#fad670 guibg=NONE gui=NONE
hi yamlDocumentHeader  guifg=#a57a4a guibg=NONE gui=NONE
hi cssURL  guifg=#fad670 guibg=NONE gui=NONE
hi cssFunctionName  guifg=#6b7fd5 guibg=NONE gui=underline
hi cssColor  guifg=#d4584a guibg=NONE gui=NONE
hi cssPseudoClassId  guifg=#abb1ff guibg=NONE gui=NONE
hi cssClassName  guifg=#abb1ff guibg=NONE gui=NONE
hi cssValueLength  guifg=#747de3 guibg=NONE gui=NONE
hi cssCommonAttr  guifg=#d4584a guibg=NONE gui=NONE
hi cssBraces  guifg=NONE guibg=NONE gui=NONE
