Extension { #name : #RSMetricsProvider }

{ #category : #'*Roassal3-Shapes-Squeak-override' }
RSMetricsProvider class >> default [
	^ default ifNil: [
		default := Smalltalk
			at: #AthensCairoCanvas
			ifPresent: [RSCairoMetricsProvider new]
			ifAbsent: [RSPharoMetricsProvider new]].
]
