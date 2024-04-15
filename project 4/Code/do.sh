#!/bin/bash

# minutes = {23, 34, 46}
minutes="23 34 46"

for minute in $minutes
do 
    octave ask1.m $minute;
done
