#!/bin/bash

function log   
{
if [ "$VERBOSE" = "Yes" ] ; then
   echo $* | tee -a ${LOG}/filesync.sh.log
else
   echo $* >> ${LOG}/filesync.sh.log
fi
}

BIN=/mnt/vg01/local/scripts
DATA=/mnt/vg01/local/data
LOG=/mnt/vg01/local/log
VERBOSE=NO
DRYRUN="--dry-run"
DELETE=""

while [ "$1" != "" ]
do
  case $1 in
    -dd) DELETE="--delete-during"
        ;;
    -go) DRYRUN=""
         ;;
   -src) SRCDIR=$2
         shift
         ;;
  -dest) DESTDIR=$2
         shift
         ;;
     -v) VERBOSE=Yes
         ;;
  esac
  shift
done    

log "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
log "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
log "Sync Run: `date`" 
log "  Source: $SRCDIR"
log "    Dest: $DESTDIR" 
log "  Dryrun: $DRYRUN" 
log " Verbose: $VERBOSE"
log "  Delete: ${DELETE}" 
log "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 

cd ${DESTDIR}
if [ "$VERBOSE" = "Yes" ] ; then
  rsync -av ${DRYRUN} ${DELETE} ${SRCDIR} ./ | tee -a ${LOG}/filesync.sh.log
else
  rsync -av ${DRYRUN} ${DELETE} ${SRCDIR} ./ >> ${LOG}/filesync.sh.log
fi

log "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
log "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
log "" 
log "" 
