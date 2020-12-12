#!/bin/bash

##################################
# MySQL List
##################################

#Linux bin paths
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
GZIP="$(which gzip)"

mysql_backup_process() {

	HOST=$1
	USERNAME=$2
	PASSWORD=$3
	PORT=$4
	HOSTNAME=$5
	MAINBACKUPDEST=$6
	IGNORELIST=$7

	# Get all database list first
	DBS="$( mysql_list_databases $HOST $USERNAME $PASSWORD $PORT )"	

	for db in $DBS
	do
	    skipdb=-1
	    if [ "$IGNORELIST" != "" ];
	    then
	        for i in ${IGNORELIST[@]}
	        do
	            [ "$db" == "${i}" ] && skipdb=1 || :
	        done
	    fi

	    if [ "$skipdb" == "-1" ] ; then
	        FILE="$BACKUPDEST/$HOSTNAME-$db.sql.gz"
	        mysql_backup_database $HOST $USERNAME $PASSWORD $PORT $FILE
	    fi
	done
}


mysql_list_databases()
{
	HOST=$1
	USERNAME=$2
	PASSWORD=$3
	PORT=$4
	
	echo $( $MYSQL --port=$PORT -u $USERNAME -h $HOST -p$PASSWORD -Bse 'show databases' )
}

mysql_backup_database()
{
        HOST=$1
        USERNAME=$2
        PASSWORD=$3
	PORT=$4
	FILE=$5

	$( $MYSQLDUMP  --port=$PORT -u $USERNAME -h $HOST -p$PASSWORD -R --routines --lock-tables=false $db | $GZIP -9 > $FILE )
}