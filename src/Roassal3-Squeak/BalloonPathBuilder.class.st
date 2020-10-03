Class {
	#name : #BalloonPathBuilder,
	#superclass : #Object,
	#instVars : [
		'contours',
		'startPoint',
		'isAbsolute'
	],
	#category : #'Roassal3-Squeak'
}

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> absolute [

	isAbsolute := true
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> closePath [

	contours last last = contours last first ifFalse: [	
		contours last 
			add: (contours last last);
			add: startPoint;
			add: startPoint]
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> curveVia: aPoint and: anotherPoint to: aThirdPoint [

	| seg |
	self duplicateLastPoint.
	seg := Bezier3Segment new
		from: self lastPoint
		via: (self toAbsolute: aPoint)
		and: (self toAbsolute: anotherPoint)
		to: (self toAbsolute: aThirdPoint).
	seg asBezierShape allButFirstDo: [:point | contours last add: point]
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> cwArcTo: endPt angle: rot [

	self flag: #todoSqueak.
	self lineTo: endPt
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> duplicateLastPoint [

	contours last size < 2 ifFalse: [
		"duplicate last contour point"
		contours last add: (contours last last)]
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> initialize [

	super initialize.
	
	contours := OrderedCollection new
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> lastPoint [

	^ contours ifNotEmpty: [contours last ifNotEmpty: [:c | c last] ifEmpty: [0 @ 0]] ifEmpty: [0 @ 0]
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> lineTo: aPoint [

	| point |
	point := self toAbsolute: aPoint.
	self duplicateLastPoint.
	contours last
		add: point;
		add: point
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> moveTo: aPoint [

	contours add: OrderedCollection new.
	contours last add: (startPoint := self toAbsolute: aPoint)
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> path [

	| cContours |
	cContours := Array new: contours size.
	1 to: cContours size do: [:i |
		cContours at: i put: (contours at: i) asArray].
	
	^ cContours
	"^ cContours collect: [:contour |
		contour last = contour first 
			ifTrue: [contour asArray] 
			ifFalse: [ (contour , { contour last. contour last. contour first }) ]
	]"
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> relative [

	isAbsolute := false
]

{ #category : #'as yet unclassified' }
BalloonPathBuilder >> toAbsolute: aPoint [

	^ isAbsolute
		ifTrue: [aPoint]
		ifFalse: [self lastPoint + aPoint]
]
