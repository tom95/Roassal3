Class {
	#name : #RsBalloonCanvas,
	#superclass : #BalloonCanvas,
	#instVars : [
		'shape',
		'paint'
	],
	#category : #'Roassal3-Squeak'
}

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> createPath: aBlock [

	| builder |
	builder := BalloonPathBuilder new.
	aBlock value: builder.
	^ builder path
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> draw [

	paint drawShape: shape on: self
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> drawShape: anObject [

	self setShape: anObject.
	self draw.
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> fillRuleEvenOdd [
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> loadIdentity [

	transform := nil
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> multiplyBy: aMatrix [

	self transformBy: aMatrix
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> pathTransform [
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> restoreAfter: aBlock [

	^ self preserveStateDuring: [:canvas | aBlock value]
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> scaleBy: aPoint [

	self transformBy: (Matrix2x3 withScale: aPoint)
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> setPaint: aPaint [

	paint := BalloonSolidColorPaint new color: aPaint
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> setPathMatrix [
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> setShape: aPath [

	shape := aPath
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> setStrokePaint: aPaint [

	paint := BalloonStrokePaint new fillPaint: aPaint.
	^ paint
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> transform [

	^ transform
]

{ #category : #'as yet unclassified' }
RsBalloonCanvas >> translateBy: aPoint [

	self transformBy: (Matrix2x3 withOffset: aPoint)
]
