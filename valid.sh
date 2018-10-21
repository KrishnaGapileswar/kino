#!/bin/bash

foo=$1
echo "filename"
echo $foo
kino=".kino"
for (( i=0; i<${#foo}; i++ )); do
  if [ "${foo:$i:1}" = "." ] && [ "${foo:$i:5}" = ".kino" ]
  then
	ext="${foo:$i:5}"
	echo $ext
	./a.out < $1
  fi
done

