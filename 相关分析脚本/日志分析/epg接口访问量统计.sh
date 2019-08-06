#统计访问前100 的url
#cat epg_2019-03-31-23.txt | awk -F"\"" '{print $20}'  | sort | uniq -c | sort -k 1 -n -r|head -100  

tatol=`cat epg_2019-03*.txt |grep -c request_url`
for line1 in `cat epgurl.txt |  awk -F"|" '{print $1}'`
do
count=`cat epg_2019*.txt |grep -c $line1`
i=$(echo "scale=1;$count*100/$tatol"|bc)%
echo "接口URL:"$line1    "本接口请求总次数:"$count    "总访问次数:"$tatol    "接口请求访问比:"$i >>urlcount.txt
done






