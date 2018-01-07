#!/bin/sh
RUN_INTERVAL=${RUN_INTERVAL:-"60"}

while [ 1 == 1 ]
do
	echo "Running find command"
	/bin/sh /cmd/find_files.sh || true
	sleep $RUN_INTERVAL
done
