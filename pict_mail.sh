#!/bin/bash

BIN=/mnt/vg01/local/scripts
DATA=/mnt/vg01/local/data
LOG=/mnt/vg01/local/log

tail -20 ${LOG}/pict_count.log | mail -s "[fs] Picture Count" tlehr
