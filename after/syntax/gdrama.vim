if exists("b:current_syntax")
	echo "shit"
	echo b:current_syntax
    finish
endif

syn keyword dramaStart Start
syn keyword dramaDone Done

syn keyword dramaBeat beat contained nextgroup=dramaBeatId
syn keyword dramaJump jump contained nextgroup=Identifier
syn keyword dramaFlag flag contained nextgroup=Identifier
syn keyword dramaGetFlag get_flag contained nextgroup=Identifier
syn keyword dramaWait wait contained nextgroup=Identifier
syn keyword dramaChoice choice contained nextgroup=dramaChoiceString
syn region dramaChoiceString start=+"+ end=+"+ contained nextgroup=dramaId
syn match dramaId "\w+" contained
syn match dramaBeatId "\w+" contained

syn match dramaBB /\v\[\/*\w+\s*[^\]]\]/ contained

syn cluster dramaKeyword contains=dramaBeat,dramaJump,dramaFlag,dramaChoice
" syn match dramaTag /\v\<\w+\s+\w*\>/ contains=@dramaKeyword,dramaId
syn match dramaJumpTag /\v\<jump\s+[^\>]*\>/ contains=dramaJump,dramaBeatId
syn match dramaBeatTag /\v\<beat\s+[^\>]*\>/ contains=dramaBeat,dramaBeatId
syn match dramaFlagTag /\v\<(get_|un)*flag\s+[^\>]*\>/ contains=dramaFlag,dramaId
syn match dramaChoiceTag /\v\<choice\s+[^\>]*\>/ contains=dramaChoice,dramaChoiceString,dramaId,dramaFlagTag
syn match dramaBranchTag /\v\<branch\s+[^\>]*\>/ contains=dramaBranch,dramaId
syn match dramaWaitTag /\v\<wait\s+[^\>]*\>/ contains=dramaWait,dramaId
syn match dramaMiscTagName /\v\<\w\s+[^\]]*]\>/ contains=dramaId,Number
syn match dramaMiscTag /\v\<\w\s+[^\>]*\>/ contains=dramaMiscTagName,Number
" syn match dramaChoiceTag /\v\<\w+\s+"[^"]+"\s+\w*\>/ nextgroup=dramaTalk contains=dramaChoice,dramaChoiceString,dramaId

syn cluster dramaTags contains=dramaJumpTag,dramaBeatTag,dramaFlagTag,dramaChoiceTag,dramaBranchTag,dramaWaitTag,dramaMiscTag


syn match dramaActor /\v^\s*\w+:/ contained nextgroup=dramaWords
syn match dramaWords /\v:.*/ contained contains=dramaMiscTag
syn match dramaLine /\v^\s*\w+:\s.*/ contains=dramaActor,@dramaTags,dramaWords,dramaBB

hi dramaBeatId guifg=green ctermfg=green
hi def link dramaBeat Keyword
hi dramaJump guifg=#F92672 ctermfg=lightred

hi def link dramaStart Constant
hi def link dramaDone Constant

hi def link dramaChoice Keyword
hi def link dramaChoiceString String
hi def link dramaId Identifier
hi def link dramaChoiceTag Statement
hi def link dramaWords Comment
hi def link dramaActor Directory
hi def link dramaTag Expression
hi def link dramaJumpTag Conditional
hi def link dramaBeatTag Function
hi def link dramaFlagTag Identifier
hi def link dramaBranchTag Boolean
hi def link dramaWaitTag Boolean
hi def link dramaChoiceTag Expression
hi def link dramaMiscTag Delimiter
hi def link dramaMiscTagName Operator

hi def link dramaBB String

let b:current_syntax = "gdrama"
