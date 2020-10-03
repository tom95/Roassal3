Extension { #name : #Rectangle }

{ #category : #'*Roassal3-Squeak' }
Rectangle >> expandRectangle: aRectangle [
	"Answer a rectangle whose size has been expanded by the receiver which represents each rectangle corner."
	
	^ Rectangle 
		left: aRectangle left - self left 
		right: aRectangle right + self right 
		top: aRectangle top - self top 
		bottom: aRectangle bottom + self bottom 
]

{ #category : #'*Roassal3-Squeak' }
Rectangle >> floatCenter [
	"Answer the float point at the center of the receiver."
	^ self topLeft + self bottomRight / 2.0
]

{ #category : #'*Roassal3-Squeak' }
Rectangle class >> floatCenter: centerPoint extent: extentPoint [ 
	"Answer an instance of me whose center is centerPoint and width 
	by height is extentPoint."
	^self origin: centerPoint - (extentPoint/2.0) extent: extentPoint
]
