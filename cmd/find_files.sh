#!/bin/sh
FIND_REGEX=${FIND_REGEX:-".*\.rar"}
FIND_OPTIONS=${FIND_OPTIONS:-"-mindepth 2"}
FIND_FOLDER=${FIND_FOLDER:-"/files"}
RUN_FILE=${RUN_FILE:-"/config/current_run.txt"}

/bin/sh -c "find $FIND_FOLDER $FIND_OPTIONS -regex $FIND_REGEX" > $RUN_FILE

while read target; do
  /bin/sh /cmd/do_unrar.sh $target
done <$RUN_FILE
