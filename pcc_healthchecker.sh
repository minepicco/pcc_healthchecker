#!/bin/bash

d=`date +%d`
while true
do
  curl -k -X GET $PCC_URL"/api/v1/_ping" > result.txt
  if [ `cat result.txt | grep -c "OK"` -eq 1 ]; then TEXT="good"; else TEXT="@channel注意！PrismaCloudで障害の可能性あり！"&&curl -X POST -d 'payload={"channel":"'$CHANNEL'","username":"'$NAME'","icon_emoji":"'$ICON'","link_names": "1","attachments": [{"text": "'$TEXT'"}]}' $WH_URL; fi
  if [ `date +%d` -eq $d ]; then echo `date`": "$TEXT >> daily.txt; else curl -F file=@daily.txt -F "initial_comment=過去24時間のサマリー" -F channels=$CHANNEL -H "Authorization: Bearer "$BOT https://slack.com/api/files.upload && rm -rf daily.txt && d=`date +%d`; fi
  sleep $ITV
done
