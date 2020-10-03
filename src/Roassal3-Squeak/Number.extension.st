Extension { #name : #Number }

{ #category : #'*Roassal3-Squeak' }
Number >> % aNumber [

	^ self \\ aNumber
]

{ #category : #'*Roassal3-Squeak' }
Number >> asMargin [

	^ Rectangle left: self right: self top: self bottom: self
]
