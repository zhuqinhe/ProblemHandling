#!/bin/sh
#
host="172.16.199.10"
port="3306"
userName="appuser"
password="Mysql123+"
dbname="cms_twzj_20181220"
#
basepath=$(pwd)
dateyyyyMMdd="$(date +%Y%m%d)"
#
logfile=${basepath}/log/updatesortnum_${dateyyyyMMdd}.log
selCmd1="select DISTINCT a.* from minimetadata_category a where (a.sortNum) in (select sortNum from minimetadata_category where recycle=0 and sortNum!=0 and sortNum!=1 and LENGTH(category_identityno>6) group by sortNum having count(*) > 1) and recycle=0 and sortNum!=0 and sortNum!=1 and fromFilterRule=0 and category_identityno like '001001001%';"
cmd1="update minimetadata_category mcc LEFT JOIN (select DISTINCT a.* from minimetadata_category a where (a.sortNum) in (select sortNum from minimetadata_category where recycle=0 and sortNum!=0 and sortNum!=1 and LENGTH(category_identityno>6) group by sortNum having count(*) > 1) and recycle=0 and sortNum!=0 and sortNum!=1 and fromFilterRule=0 and category_identityno like '001001001%') tt on mcc.contentId=tt.contentId and mcc.category_contentId=tt.category_contentId set mcc.sortNum=mcc.sortNum+RAND()*RAND()*0.2 where mcc.category_contentId=tt.category_contentId and mcc.contentId= tt.contentId;"

selCmd2="select DISTINCT a.* from minimetadata_category a where (a.sortNum) in (select sortNum from minimetadata_category where recycle=0 and sortNum!=0 and sortNum!=1 and LENGTH(category_identityno>6) group by sortNum having count(*) > 1) and recycle=0 and sortNum!=0 and sortNum!=1 and fromFilterRule=0 and category_identityno like '001001010%';"
cmd2="update minimetadata_category mcc LEFT JOIN (select DISTINCT a.* from minimetadata_category a where (a.sortNum) in (select sortNum from minimetadata_category where recycle=0 and sortNum!=0 and sortNum!=1 and LENGTH(category_identityno>6) group by sortNum having count(*) > 1) and recycle=0 and sortNum!=0 and sortNum!=1 and fromFilterRule=0 and category_identityno like '001001010%') tt on mcc.contentId=tt.contentId and mcc.category_contentId=tt.category_contentId set mcc.sortNum=mcc.sortNum+RAND()*RAND()*0.2 where mcc.category_contentId=tt.category_contentId and mcc.contentId= tt.contentId;"

selCmd3="select DISTINCT a.* from minimetadata_category a where (a.sortNum) in (select sortNum from minimetadata_category where recycle=0 and sortNum!=0 and sortNum!=1 and LENGTH(category_identityno>6) group by sortNum having count(*) > 1) and recycle=0 and sortNum!=0 and sortNum!=1 and fromFilterRule=0 and category_identityno like '001001003%';"
cmd3="update minimetadata_category mcc LEFT JOIN (select DISTINCT a.* from minimetadata_category a where (a.sortNum) in (select sortNum from minimetadata_category where recycle=0 and sortNum!=0 and sortNum!=1 and LENGTH(category_identityno>6) group by sortNum having count(*) > 1) and recycle=0 and sortNum!=0 and sortNum!=1 and fromFilterRule=0 and category_identityno like '001001003%') tt on mcc.contentId=tt.contentId and mcc.category_contentId=tt.category_contentId set mcc.sortNum=mcc.sortNum+RAND()*RAND()*0.2 where mcc.category_contentId=tt.category_contentId and mcc.contentId= tt.contentId;"

selCmd4="select DISTINCT a.* from minimetadata_category a where (a.sortNum) in (select sortNum from minimetadata_category where recycle=0 and sortNum!=0 and sortNum!=1 and LENGTH(category_identityno>6) group by sortNum having count(*) > 1) and recycle=0 and sortNum!=0 and sortNum!=1 and fromFilterRule=0 and category_identityno like '001001014%';"
cmd4="update minimetadata_category mcc LEFT JOIN (select DISTINCT a.* from minimetadata_category a where (a.sortNum) in (select sortNum from minimetadata_category where recycle=0 and sortNum!=0 and sortNum!=1 and LENGTH(category_identityno>6) group by sortNum having count(*) > 1) and recycle=0 and sortNum!=0 and sortNum!=1 and fromFilterRule=0 and category_identityno like '001001014%') tt on mcc.contentId=tt.contentId and mcc.category_contentId=tt.category_contentId set mcc.sortNum=mcc.sortNum+RAND()*RAND()*0.2 where mcc.category_contentId=tt.category_contentId and mcc.contentId= tt.contentId;"

#
startDate=`date +%Y%m%d%H%M%S`
echo "Start execute sql statement at ${startDate}." >>${logfile}
#
selCmd1_tmp=`mysql -h$host -u$userName -p$password -D$dbname -P$port -s -e "${selCmd1}"`
updateCount1=${selCmd1_tmp}
echo "Need to update 001001001 record count:${updateCount1}" >>${logfile}
if [ -z "${updateCount1}" ] ; then
  echo "No order log to update." >> ${logfile}
else
#
  mysql -h$host -u$userName -p$password -D$dbname -P$port -s -e "${cmd1}"
  echo "cmd1" 
fi
#

#
selCmd2_tmp=`mysql -h$host -u$userName -p$password -D$dbname -P$port -s -e "${selCmd2}"`
updateCount2=${selCmd2_tmp}
echo "Need to update 001001010 record count:${updateCount2}" >>${logfile}
if [ -z "${updateCount2}" ] ; then
  echo "No order log to update." >> ${logfile}
else
#
  mysql -h$host -u$userName -p$password -D$dbname -P$port -s -e "${cmd2}"
   echo "cmd2" 
fi
#

#
selCmd3_tmp=`mysql -h$host -u$userName -p$password -D$dbname -P$port -s -e "${selCmd3}"`
updateCount3=${selCmd3_tmp}
echo "Need to update 001001003 record count:${updateCount3}" >>${logfile}
if [ -z "${updateCount3}" ] ; then
  echo "No order log to update." >> ${logfile}
else
#
  mysql -h$host -u$userName -p$password -D$dbname -P$port -s -e "${cmd3}"
   echo "cmd3" 
fi
#

#
selCmd4_tmp=`mysql -h$host -u$userName -p$password -D$dbname -P$port -s -e "${selCmd4}"`
updateCount4=${selCmd4_tmp}
echo "Need to update 001001014 record count:${updateCount4}" >>${logfile}
if [ -z "${updateCount4}" ] ; then
  echo "No order log to update." >> ${logfile}
else
#
  mysql -h$host -u$userName -p$password -D$dbname -P$port -s -e "${cmd4}"
   echo "cmd4" 
fi
#
endDate=`date +%Y%m%d%H%M%S`
echo "Finish execute sql statement at ${endDate}." >>${logfile}
