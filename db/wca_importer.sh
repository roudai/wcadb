#!/bin/sh
cd $(dirname $0)
. ./dbinfo

WCA_EXPORT_DIR="https://www.worldcubeassociation.org/results/misc/"
WCA_EXPORT_HTML="export.html"

WCADB_PATH="/var/www/html/wcadb/db/"
WCADBJP_PATH="/var/www/html/wcadbjp/db/"
LOGFILE="wca_importer.log"
TWEET_PATH="../twitter/kotoriotoko/BIN/tweet.sh"

NOWFILE=$(ls WCA_export[0-9]*_[0-9]*.sql.zip 2> /dev/null)

# Getting file name of latest WCA export
name=$(curl -s ${WCA_EXPORT_DIR}${WCA_EXPORT_HTML} | grep -o -e 'WCA_export[0-9]*_[0-9]*.sql.zip' | uniq)

# Downloading WCA export if it's uploaded
if [ ! -e latest ] || [ ${name} != $(cat latest) ]; then 
  echo $(date) "START" | tee -a ${LOGFILE}
  if [ "${NOWFILE}" != ${name} ]; then 
    rm ${NOWFILE}
    wget ${WCA_EXPORT_DIR}${name}
  fi
  unzip -o ${name}
  mysql -u ${MYSQL_USER} -p${MYSQL_PASS} --default-character-set=utf8 ${MYSQL_DB} < WCA_export.sql
  rm WCA_export.sql README.txt

  if [ $? -eq 0 ]; then
    echo $(date) "Successfully imported ${name}" | tee -a ${LOGFILE}
  else
    echo $(date) "Failed to import to MySQL." | tee -a ${LOGFILE}
  fi

else
  echo $(date) "No update." | tee -a ${LOGFILE}
  exit 0 
fi

for sqlfile in sql/wcadb.sql sql/kinchranks.sql sql/kinchranks_country.sql sql/awecc.sql
do
  echo $(date) "START ${sqlfile}" | tee -a ${LOGFILE}
  mysql -u ${MYSQL_USER} -p${MYSQL_PASS} --default-character-set=utf8 ${MYSQL_DB} < ${sqlfile}
  if [ $? -eq 0 ]; then
    echo $(date) "END   ${sqlfile}" | tee -a ${LOGFILE}
  else
    echo $(date) "Failed to run ${sqlfile}" | tee -a ${LOGFILE}
    exit 1
  fi
done

echo $(date) "START awecc_update.php" | tee -a ${LOGFILE}
/usr/bin/php awecc_update.php
if [ $? -eq 0 ]; then
  echo $(date) "END   awecc_update.php" | tee -a ${LOGFILE}
else
  echo $(date) "Failed to run awecc_update.php." | tee -a ${LOGFILE}
  exit 1 
fi

echo $(date) "START dbdump and import" | tee -a ${LOGFILE}
mysqldump -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DB} > wcadbdump.sql
mysql -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DB2} < wcadbdump.sql
echo $(date) "END   dbdump and import" | tee -a ${LOGFILE}

message=$(echo ${name} | cut -f1 -d".")"にアップデートしました。 http://wcadb.jp"
${TWEET_PATH} $message

echo ${name} > latest
cp -f ${WCADB_PATH}latest ${WCADBJP_PATH}latest
echo $(date) "FINISH" | tee -a ${LOGFILE}
