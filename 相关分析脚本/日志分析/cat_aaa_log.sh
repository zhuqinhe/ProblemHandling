#!/usr/bin/env bash
AAA_FILE_NAME="aaa*_2019.txt"
AAA_LOG_NAME="aaa*.log.2019-03/aaa.log.2019-03-*"
for line in `cat ${AAA_FILE_NAME} | awk -F " " '{print $2,$6}'| awk -F "|" '{print $0,$1}'`;
do
aaa_user=`grep $line $AAA_LOG_NAME | grep 'user='| grep 'user'| awk -F '[ ,=]' '{print $11}'| tail -n1`
content_id=`cat ${AAA_FILE_NAME} |grep $line| awk -F " " '{print $2,$6}'| awk -F "[ ,=,&]" '{print $9}'`;
product_id=`cat ${AAA_FILE_NAME} |grep $line|awk -F " " '{print $2,$6}'| awk -F "[ ,=,&]" '{print $13}'`;
user_id=`grep $line $AAA_LOG_NAME | grep 'UserID' | awk -F '[(,)]' '{print $2}'| tail -n1`
user_token=`cat ${AAA_FILE_NAME} |grep $line|awk -F " " '{print $2,$6}'| awk -F "[ ,=,&]" '{print $5}'`;
#echo $user_token
#aaa_time=`cat ${AAA_FILE_NAME} |grep $line| cut -b20-38| tail -n1`
#echo $aaa_time
#echo $aaa_user
#aaa_time=`grep $aaa_user db1.txt|tail -n1|awk -F "#" '{print $1}'`
#echo $aaa_time
#order_time=`date -d "$aaa_time" +%Y%m%d%H%M%S`
#end_time=`expr $order_time + 172800`
#end_time=`date -d "$aaa_time 2 days" +%Y%m%d%H%M%S`
#echo "token:${line},user:${aaa_user},user_id:${user_id},product_id:${product_id},content_id:${content_id}"
if [ ! -n "$aaa_user" ]; then 
   aaa_user=`grep $line map.txt|tail -n1|awk -F " " '{print $2}'`
 
fi
if [ ! -n "$user_id" ]; then  
   user_id=`grep $aaa_user map.txt|tail -n1|awk -F " " '{print $3}'`

fi
aaa_time=`grep $aaa_user db1.txt|tail -n1|awk -F "#" '{print $1}'`
#echo $aaa_time
order_time=`date -d "$aaa_time" +%Y%m%d%H%M%S`
#end_time=`expr $order_time + 172800`
end_time=`date -d "$aaa_time 2 days" +%Y%m%d%H%M%S`
echo $line
echo "${aaa_user}|${user_id}|${product_id}_PPV|${content_id}|30.00|${order_time}|${end_time}"
done
