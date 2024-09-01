#!/bin/bash
number1=$1
number2=$2

echo first number is "$1"
echo second number is "$2"

Sum= $(( $number1+$number2 ));
echo total is : $sum;
