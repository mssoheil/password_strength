#!/bin/bash

read -p "please enter your password: " password

length=$(echo -n $password | wc -c)

calculateRate() {
	local rate=0
	numeric=$(echo -n $password | egrep -o '[0-9]' | wc -l)
	alpha=$(echo -n $password | egrep -o '[a-zA-Z]' | wc -l)
	special=$(echo -n $password | egrep -o '[-+=_)(*&^%$#@!~`<,>.?/\ ]' | wc -l)

	if [[ $length -gt 8 ]]; then
		(( rate += ( ( $length - 8) * 3 ) ))
	fi

	(( rate += ($special) * 4 ))

	if [[ $numeric -gt 1 && $alpha -gt 1 ]]; then
		(( rate += ($numeric * $alpha) ))
	fi

	echo $rate
	return $rate
}

calculateRate
calculatedRate=$?

if [[ $length -lt 8 ]]; then
	echo "The password strength rate is $calculatedRate.The password is very weak. You should change it immediately"
	exit 1
fi

if [[ $calculatedRate -gt 8 && $calculatedRate -lt 16 ]]; then
	echo "The password strength rate is $calculatedRate. It's fairly weak password."
	exit 1
fi

if [[ $calculatedRate -gt 16 && $calculatedRate -lt 32 ]]; then
	echo "The password strength rate is $calculatedRate. It has a moderate strength."
	exit 1
fi

if [[ $calculatedRate -gt 32 && $calculatedRate -lt 40 ]]; then
	echo "The password strength rate is $calculatedRate. It's a strong password."
	exit 1
fi

if [[ $calculatedRate -gt 40 ]]; then
	echo "The password strength rate is $calculatedRate. It's a vary strong password."
	exit 1
fi

