#!/bin/bash

while true

  curl -k -X GET $PCC_URL"/api/v1/_ping" > result.txt
  if [ `cat result.txt | grep -c "OK"` -eq 1 ]; then TEXT="good"; else TEXT="@channel Prisma Cloudで障害の可能性あり！"; fi
  curl -X POST -d 'payload={"channel":"'$CHANNEL'","username":"'$NAME'","icon_emoji":"'$ICON'","link_names": "1","attachments": [{"text": "'$TEXT'"}]}' 
done
