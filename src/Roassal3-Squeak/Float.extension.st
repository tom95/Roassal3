Extension { #name : #Float }

{ #category : #'*Roassal3-Squeak' }
Float >> round: numberOfWishedDecimal [
	"Round the decimal part of the receiver to be limited to the number of wished decimal. Only leave a fixed amount of decimal"
   "(10.12345 round: 2) >>> 10.12 "
        
	^(self asFraction round: numberOfWishedDecimal) asFloat
]
