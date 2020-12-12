#!/bin/bash

###################################
# Includes
###################################
source /opt/pixies/mysql.sh

###################################
# Parameters Configuration
###################################

DBUSER=$DB_USER    
DBPASSWORD=$DB_PASSWORD  
DBHOST=$DB_HOST  
DBPORT="3306"
HOSTNAME=$TARGET_HOSTNAME 
PROCESS="$HOSTNAME-MYSQL"

# Backup Dest directory, change this if you have someother location
BACKUPDEST="/data"
 
# Store list of databases
LOG="/opt/pixys/$PROCESS.log"
 
# Ignore List, DO NOT BACKUP these databases
IGNORELIST=( mysql phpmyadmin information_schema performance_schema sys )

##################################
# Process ** DO NOT MODIFY **
##################################

mysql_backup_process $DBHOST $DBUSER $DBPASSWORD $DBPORT $HOSTNAME $BACKUPDEST $IGNORELIST $LOG
/usr/bin/aws s3 sync $BACKUPDEST/ s3://$BUCKET_NAME/$HOSTNAME/dbs/