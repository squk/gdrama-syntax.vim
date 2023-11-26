if exists("b:current_syntax")
    finish
endif

sy keyword dramaBeat beat
sy keyword dramaChoice choice
sy keyword dramaJump jump

sy cluster dramaKeywords contains=dramaBeat,dramaChoice,dramaJump

syn region dramaTag contained start=+<+ end=+>+ contains=dramaKeywords,dramaIdentifier display
syn region  dramaString contained start=+"+ end=+"+

hi def link dramaKeywords Keyword
hi def link dramaTag Symbol
hi def link dramaString String

let b:current_syntax = "gdrama"
