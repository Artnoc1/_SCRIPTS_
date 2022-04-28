

rm $LOGFILE;
exec >> "${LOGFILE}" 2>&1
set -x
