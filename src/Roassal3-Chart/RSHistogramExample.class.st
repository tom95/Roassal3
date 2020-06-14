Class {
	#name : #RSHistogramExample,
	#superclass : #Object,
	#category : #'Roassal3-Chart-Histogram'
}

{ #category : #'as yet unclassified' }
RSHistogramExample >> example01 [
	<script: 'self new example01 inspect'>
	| h |
	h := RSHistogram new.
	h
		values:
			#(189 23 15 4 3 4 5 14 8 15 15 4 5 18 3 10 5 8 10 4 18 42 44 15 43 43 9 9).
	h maxValueBlock: 200.
	h minValueBlock: 0.
	h numberOfBuckets: 10.
	^ h build
]
