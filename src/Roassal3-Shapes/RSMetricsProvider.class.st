"
A metric provider returns an instance of RSTextExtents, used by RSLabel.
Users can propose a different RSMetricProvider. RSLabel uses by default `RSMetricProvider defaultProvider`

"
Class {
	#name : #RSMetricsProvider,
	#superclass : #RSObject,
	#classVars : [
		'Default'
	],
	#category : #'Roassal3-Shapes-Text'
}

{ #category : #accessing }
RSMetricsProvider class >> default [
	^ Default ifNil: [
		Default := Smalltalk
			at: #AthensCairoCanvas
			ifPresent: [RSCairoMetricsProvider new]
			ifAbsent: [RSPharoMetricsProvider new]].
]

{ #category : #accessing }
RSMetricsProvider class >> default: aRSMetricsProvider [
	Default := aRSMetricsProvider
]

{ #category : #hooks }
RSMetricsProvider >> extentsOf: aRSLabel [
	^ self subclassResponsibility
]
