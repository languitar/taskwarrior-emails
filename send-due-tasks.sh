#!/bin/bash

task sync

task status:pending tags.hasnt:notified due.before:now+8h export |
jq -r -c ".[]" |
while IFS= read -r object
do
    uuid=$(echo "$object" | jq -r '.uuid')
    description=$(echo "$object" | jq -r '.description')
    due=$(echo "$object" | jq -r '.due')
    human_due="$(date -d "$(echo $due | sed -r 's/(.*)T(..)(..)(..)/\1 \2:\3:\4/')")"
    echo -e "Due task\n\n$description\n\nat: $human_due\nuuid: $uuid" | mail -s "Due task $description" -r tasks@semipol.de languitar@semipol.de -- 
    task rc.recurrence.confirmation=no "$uuid" modify +notified
done

task sync
