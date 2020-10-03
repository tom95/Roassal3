Extension { #name : #TextEmphasis }

{ #category : #'*Roassal3-Squeak' }
TextEmphasis >> add: anotherCodeOrEmphasis [

	emphasisCode := emphasisCode bitOr: anotherCodeOrEmphasis value
]

{ #category : #'*Roassal3-Squeak' }
TextEmphasis class >> fromCode: anIntegerBitMask [
	^ self new emphasisCode: (anIntegerBitMask bitAnd: 2r11111)
]

{ #category : #'*Roassal3-Squeak' }
TextEmphasis >> value [

	^ emphasisCode
]
