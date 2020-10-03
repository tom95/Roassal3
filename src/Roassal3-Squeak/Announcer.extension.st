Extension { #name : #Announcer }

{ #category : #'*Roassal3-Squeak' }
Announcer >> numberOfSubscriptions [
	^ registry numberOfSubscriptions
]

{ #category : #'*Roassal3-Squeak' }
Announcer >> subscriptions [

	^ registry
]
