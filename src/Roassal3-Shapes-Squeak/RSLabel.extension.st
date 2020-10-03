Extension { #name : #RSLabel }

{ #category : #'*Roassal3-Shapes-Squeak-override' }
RSLabel >> createFont [
	| aFont |
	aFont := Smalltalk
		at: #LogicalFont
		ifPresent: [:cl | cl familyName: fontName pointSize: fontSize]
		ifAbsent: [TextStyle defaultFont].
	
	aFont := aFont emphasized: emphasis emphasisCode.
	^ aFont
]
