#!/bin/BASH
sed s/INCORRECT_PASSWORD/ACCESS_DENIED/ LogA.txt > access_denied.txt
awk '{print $4, $6}' access_denied.txt > filtered.logs.txt

