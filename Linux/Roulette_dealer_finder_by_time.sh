#!/bin/bash
echo Date and Time
echo $1 and $2 $3
grep "^$2 $3" /03-student/homework/Roulette_Loss_Investigation/Dealer_Analysis/$1_Dealer_schedule  | awk '{print $5 $6}'

