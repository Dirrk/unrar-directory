#!/bin/sh
FILE=`realpath $1`
FOLDER=`dirname $FILE`
IGNORE_FILE=${IGNORE_FILE:-"/config/list.txt"}

if [ ! -e $IGNORE_FILE ]; then
    touch $IGNORE_FILE
fi

unrar x $FILE -o- -x@$IGNORE_FILE $FOLDER
RESULT=$?
if [ $RESULT == 0 ]; then
    echo "Saving file $FILE"
    echo "$FILE" >> $IGNORE_FILE
else
    echo "Skipped extraction $RESULT"
fi
