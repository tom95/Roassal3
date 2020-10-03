Class {
	#name : #RSBalloonMorph,
	#superclass : #RSAthensMorph,
	#category : #'Roassal3-Squeak'
}

{ #category : #'as yet unclassified' }
RSBalloonMorph >> checkSession [
]

{ #category : #'as yet unclassified' }
RSBalloonMorph >> createSurface [
	surface := Form extent: self extent asIntegerPoint depth: 32
]

{ #category : #'as yet unclassified' }
RSBalloonMorph >> drawOn: aCanvas [

	"Draw the whole visualization"
	isDrawing ifTrue: [ ^ self ].
	isDrawing := true.
	[
		self checkSession.
		self recreateSurfaceIfNecessary.
		aCanvas fillRectangle: bounds color: roassalCanvas color.
		
		roassalCanvas playAnimations.
		self drawShapes.
		
		self flag: #todo. " can also directly drawn on aCanvas, just gotta make sure coordiantes are right "
		aCanvas
			image: surface asForm
			at: self bounds origin asIntegerPoint
			sourceRect: (0 @ 0 extent: surface extent)
			rule: 34]
	ensure: [isDrawing := false ]
]

{ #category : #'as yet unclassified' }
RSBalloonMorph >> drawShapes [
	"The drawing has to be done when a change in the shapes occured or when there is an animation."
		| camera canvasRect athensCanvas |
			
	athensCanvas := (RsBalloonCanvas on: surface)
		setOrigin: 0 @ 0 clipRect: surface boundingBox;
		aaLevel: 4;
		yourself.
	
		roassalCanvas clearBackground
			ifTrue: [ surface clear ].
		"We display the elements that are subject to the camera"
		camera := roassalCanvas camera.
		athensCanvas pathTransform
			translateBy: (self extent / 2) asFloatPoint;
			scaleBy: camera scale asFloat;
			translateBy: camera position negated asFloatPoint.
		renderer canvas: athensCanvas.
		canvasRect := roassalCanvas visibleRectangle.
		
		roassalCanvas shapes do: [ :roassalShape | 
				(roassalShape intersects: canvasRect)
					ifTrue: [ roassalShape accept: renderer ] ].
		
		self showRectanglesIfNecessary: roassalCanvas shapes.
		"We display the elements that are _NOT_ subject to the camera"
		athensCanvas pathTransform loadIdentity scaleBy: 1.0001.
		roassalCanvas fixedShapes do: [ :roassalShape | 
			roassalShape accept: renderer ].
		"debug mode to show encompassingRectangles"
		self showRectanglesIfNecessary: roassalCanvas fixedShapes. 
		

]

{ #category : #'as yet unclassified' }
RSBalloonMorph >> initializeSession [
]
