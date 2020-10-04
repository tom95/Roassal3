Class {
	#name : #StandardFonts,
	#superclass : #Object,
	#category : #'Squeak-Roassal3-Base'
}

{ #category : #'as yet unclassified' }
StandardFonts class >> defaultFont [

	^ TextStyle defaultFont

]

{ #category : #'as yet unclassified' }
StandardFonts class >> listFont [

	^ Preferences standardListFont
]

{ #category : #'as yet unclassified' }
StandardFonts class >> menuFont [

	^ Preferences standardMenuFont
]
