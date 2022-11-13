#!/bin/bash
[[ -z "$1" ]] && { echo "Executable not specified. Please use run_tests.sh ./<executable_name>" ; exit 1; }
IND=1
FILE_COUNT=$(ls -1q tests/*.in | wc -l)
ERROR_COUNT=0
SCRIPT_PATH=$(pwd)
for filename in tests/*.in; do
    DIFF=$(diff -uw "${filename%.*}".out <(./"$1" -i "$SCRIPT_PATH"/"$filename"))
    if [ "$DIFF" != "" ]; then
        ERROR_COUNT=$((ERROR_COUNT+1))
        echo "[Test $IND/$FILE_COUNT ERROR]"
        echo "$DIFF"
    else
        echo "[Test $IND/$FILE_COUNT OK]"
    fi
    IND=$((IND+1))
done
echo
echo
echo "Run $FILE_COUNT tests with $ERROR_COUNT errors."