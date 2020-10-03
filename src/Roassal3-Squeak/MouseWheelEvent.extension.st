Extension { #name : #MouseWheelEvent }

{ #category : #'*Roassal3-Squeak' }
MouseWheelEvent >> direction [

	^ self isWheelDown
		ifTrue: [Character arrowDown]
		ifFalse: [
			self isWheelUp
				ifTrue: [Character arrowUp]
				ifFalse: [
					self isWheelLeft
						ifTrue: [Character arrowLeft]
						ifFalse: [Character arrowRight]]]
]
