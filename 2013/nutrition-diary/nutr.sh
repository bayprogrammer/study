#!/bin/sh

# got hints from: http://stackoverflow.com/questions/7352008/read-lines-in-file-into-2-variables-in-shellscript

# Get file descriptor
exec 6<zebs-nutrition-diary.txt

# running total
rt=0
while read l <&6; do
    v=`echo $l | cut -f 1 -d' '`
    # make sure we're not blank
    if [ "$v" ]; then
        # ignore comments
        if [ "$v" != '#' ]; then
            # ignore date lines
            if ! echo $v | grep '^[0-9]*-' > /dev/null; then
                # echo $rt + $v
                rt=`expr $rt + $v`
            fi
        fi
    fi
done
echo $rt

# discard file descriptor
exec 6<&-

