#!/bin/bash

read -p "please enter your password: " password

rate=0

length=$(echo -n $password | wc -c)
numeric=$(echo -n $password | egrep -o '[0-9]+' | wc -c)
alpha=$(echo -n $password | egrep -o '[a-zA-Z]+' | wc -c)
special=$(echo -n $password | egrep -o '[`~!@#$%^&*()_+=,./\\|\\;\:\]\}\[\{\"\']+' | wc -c)


if [[ $length -gt 8 ]]; then
	(( rate += ( ( $length - 8) * 3 ) ))
fi

echo "numeric count: $numeric"

echo $rate




