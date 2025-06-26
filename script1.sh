#!/bin/bash
uname -a
echo "Hello from second job!"
echo "$param1"
RESULT=$((num1 + num2))
echo $RESULT
echo "text to file from second Job - relative path" >> file.txt
