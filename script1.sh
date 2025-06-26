#!/bin/bash
uname -a
echo "Hello from third job !"
echo "$param1"
RESULT=$((num1 + num2))
echo $RESULT
echo "Text to file from third Job" >> file.txt
