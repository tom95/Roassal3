Class {
	#name : #RSBalloonRenderer,
	#superclass : #RSAthensRenderer,
	#category : #'Roassal3-Squeak'
}

{ #category : #'as yet unclassified' }
RSBalloonRenderer >> drawSimpleLabel: label [
	(label paint isNil) ifTrue: [ ^ self ].
	
	" FIXME: if we continue painting on our ballooncanvas all subsequent balloon operations (not formcanvas operations) will not appear on the canvas "
	athensCanvas form getCanvas
		drawString: label text at: athensCanvas transform offset font: label font color: label paint
]
