#!/bin/bash

PICTS=/mnt/vg01/media/pictures
BIN=/mnt/vg01/local/scripts
DATA=/mnt/vg01/local/data
LOG=/mnt/vg01/local/log

cd ${PICTS}
#fcount=`find . | wc -l`
fcount=`find . | grep -vi thumbs.db | grep -vi picasa.ini | wc -l`


if [ ! -f ${DATA}/.last_pict_count ] 
then
   echo $fcount > ${DATA}/.last_pict_count
fi  
lcount=`cat ${DATA}/.last_pict_count`

echo "`date` : $fcount" >> ${LOG}/pict_count.log
if [ $lcount -ne $fcount ] 
then
  echo "*****************************************" >> ${LOG}/pict_count.log
  echo "*** Error, Picture Count has changed !!! " >> ${LOG}/pict_count.log
  echo "*****************************************" >> ${LOG}/pict_count.log
  su - tlehr -c ${BIN}/pict_mail.sh
fi
  
echo $fcount > ${DATA}/.last_pict_count
