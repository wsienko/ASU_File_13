#!/bin/bash
echo Date Time and Casino Game Being Played
echo $1 and $2 $3 and Dealer Staff 
echo BlackJjack   Roulette   Texas_Hold_EM
grep "^$2 $3" /03-student/homework/Roulette_Loss_Investigation/Dealer_Analysis/$1_Dealer_schedule | awk '{print $3 $4 " " $5 $6 " " $7 $8}'

