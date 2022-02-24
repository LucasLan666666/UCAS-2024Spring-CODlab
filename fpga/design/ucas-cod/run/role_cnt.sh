#!/bin/bash

CNT_FILE="/root/cnt"
LOCK_FILE="/root/lock"

while true
do
        if [ ! -f $LOCK_FILE ];then
                echo $$>$LOCK_FILE
                break
        else
                sleep 1
                echo lock
        fi
done

PID=`cat $LOCK_FILE`

if [ $PID != $$ ];then
        echo "Please retry this job!"
        exit 1;
fi

if [ -f $CNT_FILE ];then
        CNT=`cat $CNT_FILE`
        if (( $CNT < 4 ));then
                CNT_NEXT=`expr $CNT + 1`
        else
                CNT_NEXT=0
        fi
        echo $CNT_NEXT > $CNT_FILE
        export RUNNER_CNT=$CNT_NEXT
        echo "RUNNER_CNT = $RUNNER_CNT"
else
        echo 0 > $CNT_FILE
        export RUNNER_CNT=0
        echo "RUNNER_CNT = $RUNNER_CNT"
fi

rm -f $LOCK_FILE
