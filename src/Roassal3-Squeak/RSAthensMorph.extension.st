Extension { #name : #RSAthensMorph }

{ #category : #'*Roassal3-Squeak-override' }
RSAthensMorph >> initialize [
	super initialize.
	self createSurface.
	self initializeSession.
	isDrawing := false
]

{ #category : #'*Roassal3-Squeak-override' }
RSAthensMorph >> initializeSession [

	session := Smalltalk session
]
