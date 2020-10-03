Extension { #name : #SubscriptionRegistry }

{ #category : #'*Roassal3-Squeak-override' }
SubscriptionRegistry >> getInteractionsForClass: eventClass [
	"Return the list of subscription for a given Event class"
	| answer |
	answer := OrderedCollection new.
	subscriptionsByAnnouncementClasses keys do: [ :class | 
		((class == eventClass) or: 
			[ class inheritsFrom: eventClass ]) ifTrue: [ answer addAll: (subscriptionsByAnnouncementClasses at: class) ] ].
	^ answer
]

{ #category : #'*Roassal3-Squeak-override' }
SubscriptionRegistry >> handleEventClass: eventClass [
	"Return true if the receiver has a callback subscripbed for the event class"
	^ subscriptionsByAnnouncementClasses keys
		anySatisfy: [ :sub | sub includesBehavior: eventClass ]
]

{ #category : #'*Roassal3-Squeak-override' }
SubscriptionRegistry >> handleSubscriberClass: eventClass [
	"Return true if the receiver has a callback subscripbed for the event class"
	^ subscriptionsByAnnouncementClasses includesKey: eventClass
]

{ #category : #'*Roassal3-Squeak-override' }
SubscriptionRegistry >> numberOfSubscriptions [
	^ subscriptionsByAnnouncementClasses values inject: 0 into: [:sum :list | sum + list size]
]
