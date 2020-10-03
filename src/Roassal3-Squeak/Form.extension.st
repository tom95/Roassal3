Extension { #name : #Form }

{ #category : #'*Roassal3-Squeak' }
Form >> asForm [

	^ self
]

{ #category : #'*Roassal3-Squeak' }
Form >> clear [

	self bits: ( Bitmap new: self bits size).
]

{ #category : #'*Roassal3-Squeak' }
Form >> hasBeenFreed [

	^ false
]
