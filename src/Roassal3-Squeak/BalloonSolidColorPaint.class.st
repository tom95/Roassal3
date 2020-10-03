Class {
	#name : #BalloonSolidColorPaint,
	#superclass : #Object,
	#instVars : [
		'color'
	],
	#category : #'Roassal3-Squeak'
}

{ #category : #'as yet unclassified' }
BalloonSolidColorPaint >> color: aColor [

	color := aColor
]

{ #category : #'as yet unclassified' }
BalloonSolidColorPaint >> drawShape: aShape on: aCanvas [

	aCanvas drawGeneralBezierShape: aShape color: color borderWidth: 0 borderColor: nil
]
