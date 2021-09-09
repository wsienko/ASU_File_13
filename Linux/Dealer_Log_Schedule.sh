#!/bin/bash
awk '/05:00:00 AM/ {print "0310 " $1,$2,$5,$6}' 0310_Dealer_schedule
awk '/05:00:00 AM/ {print "0312 " $1,$2,$5,$6}' 0312_Dealer_schedule
awk '/05:00:00 AM/ {print "0315 " $1,$2,$5,$6}' 0315_Dealer_schedule
awk '/08:00:00 AM/ {print "0310 " $1,$2,$5,$6}' 0310_Dealer_schedule
awk '/08:00:00 AM/ {print "0312 " $1,$2,$5,$6}' 0312_Dealer_schedule
awk '/08:00:00 AM/ {print "0315 " $1,$2,$5,$6}' 0315_Dealer_schedule
awk '/02:00:00 PM/ {print "0310 " $1,$2,$5,$6}' 0310_Dealer_schedule
awk '/02:00:00 PM/ {print "0312 " $1,$2,$5,$6}' 0312_Dealer_schedule
awk '/02:00:00 PM/ {print "0315 " $1,$2,$5,$6}' 0315_Dealer_schedule
awk '/08:00:00 PM/ {print "0310 " $1,$2,$5,$6}' 0310_Dealer_schedule
awk '/08:00:00 PM/ {print "0312 " $1,$2,$5,$6}' 0312_Dealer_schedule
awk '/11:00:00 PM/ {print "0310 " $1,$2,$5,$6}' 0310_Dealer_schedule
awk '/11:00:00 PM/ {print "0312 " $1,$2,$5,$6}' 0312_Dealer_schedule

