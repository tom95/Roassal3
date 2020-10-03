Extension { #name : #Fraction }

{ #category : #'*Roassal3-Squeak' }
Fraction >> round: numberOfWishedDecimal [
	"Round the decimal part of the receiver to be limited to the number of wished decimal. Only leave a fixed amount of decimal"
   "(1/3 round: 2) >>> (33/100) "   
	"(111/100 round: 2) >>> (111/100) "
	
	^self roundTo: (10 raisedTo: numberOfWishedDecimal negated)
]
