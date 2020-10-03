Class {
	#name : #StandardFonts,
	#superclass : #Object,
	#category : #'Roassal3-Pharo-Squeak'
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
