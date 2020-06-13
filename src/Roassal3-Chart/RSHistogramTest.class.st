Class {
	#name : #RSHistogramTest,
	#superclass : #TestCase,
	#category : #'Roassal3-Chart-Histogram'
}

{ #category : #tests }
RSHistogramTest >> testBasic [

	| values h b |
	values := #(189 23 15 4 3 4 5 14 8 15 15 4 5 18 3 10 5 8 10 4 18 42 44 15 43 43 9 9).
	h := RSHistogram new.
	h values: values.
	h numberOfBuckets: 10.
	b := h getBuckets.
	self assert: b equals:  #(#(15 4 3 4 5 14 8 15 15 4 5 18 3 10 5 8 10 4 18 15 9 9) #(23) #(42 44 43 43) #() #() #() #() #() #() #(189))
]

{ #category : #tests }
RSHistogramTest >> testBasic2 [

	| values h b |
	values := #(5 4 3 2 2 1 3 3).
	h := RSHistogram new.
	h values: values.
	h numberOfBuckets: values asSet max.
	b := h getBuckets.
	self assert: b equals: #(#(1) #(2 2) #(3 3 3) #(4) #(5)).
]

{ #category : #tests }
RSHistogramTest >> testBasic3 [

	| values h b |
	values := #(5 4 3 2 2 1 3 3).
	h := RSHistogram new.
	h values: values.
	h maxValueBlock: 100.
	h numberOfBuckets: values asSet max.
	b := h getBuckets.
	self assert: b equals: #(#(5 4 3 2 2 1 3 3) #() #() #() #())
]

{ #category : #tests }
RSHistogramTest >> testBasic4 [

	| values h b |
	values := #(1 1 1 1 2 2 2 2 2 2 2 2).
	h := RSHistogram new.
	h values: values.
	h numberOfBuckets: 2.
	h maxValueBlock: 3.
	
	self assert: h getBucketsDelimiters equals: #(1 2 3).

	b := h getBuckets.
	self assert: b equals: #(#(1 1 1 1) #(2 2 2 2 2 2 2 2))
]

{ #category : #tests }
RSHistogramTest >> testBasic5 [

	| values h b bd |
	values := #(189 23 15 4 3 4 5 14 8 15 15 4 5 18 3 10 5 8 10 4 18 42 44 15 43 43 9 9).
	h := RSHistogram new.
	h minValueBlock: 0.
	h maxValueBlock: 200.
	h values: values.
	h numberOfBuckets: 10.
	
	bd := h getBucketsDelimiters.
 	self assert: bd equals: #(0 20 40 60 80 100 120 140 160 180 200).
 
	b := h getBuckets.
	self assert: b equals: #(#(15 4 3 4 5 14 8 15 15 4 5 18 3 10 5 8 10 4 18 15 9 9) #(23) #(42 44 43 43) #() #() #() #() #() #() #(189))
]
