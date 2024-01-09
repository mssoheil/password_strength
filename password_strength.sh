#!/bin/bash

read -p "please enter your password: " password

rate=0

length=$(echo -n $password | wc -c)
numeric=$(echo -n $password | egrep -o '[0-9]' | wc -l)
alpha=$(echo -n $password | egrep -o '[a-zA-Z]' | wc -l)
special=$(echo -n $password | egrep -o '[-+=_)(*&^%$#@!~`<,>.?/]' | wc -l)


if [[ $length -gt 8 ]]; then
	(( rate += ( ( $length - 8) * 3 ) ))
fi

(( rate += ($special) * 4 ))

if [[ $numeric -gt 1 && $alpha -gt 1 ]]; then
	(( rate += ($numeric * $alpha) ))
fi


echo "The password strength rate is: $rate"




