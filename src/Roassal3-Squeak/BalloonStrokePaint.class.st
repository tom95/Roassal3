Class {
	#name : #BalloonStrokePaint,
	#superclass : #Object,
	#instVars : [
		'width',
		'fillPaint'
	],
	#category : #'Roassal3-Squeak'
}

{ #category : #'as yet unclassified' }
BalloonStrokePaint >> dashes: anAlternateCollectionOfLenghts offset: anOffset [
]

{ #category : #'as yet unclassified' }
BalloonStrokePaint >> drawShape: aShape on: aCanvas [

	aCanvas drawGeneralBezierShape: aShape color: Color transparent borderWidth: width borderColor: fillPaint
]

{ #category : #'as yet unclassified' }
BalloonStrokePaint >> fillPaint: anObject [

	fillPaint := anObject
]

{ #category : #'as yet unclassified' }
BalloonStrokePaint >> width: aNumber [

	width := aNumber max: 1
]
