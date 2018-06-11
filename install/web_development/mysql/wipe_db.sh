#!/bin/bash

# Wipe a database
# sudo sh wipe_db.sh dbname

DBUSER="xxxxxxxxxxxx"
DBPASS="yyyyyyyyyyyyyy"

DBNAME="$1"

# Require the database argument.
[ $# -eq 0 ] && {
  echo "Please specify a valid MySQL database: $0 [database_goes_here]" ;
  exit 1;
}

# Drop the given database with mysql
mysql -u$DBUSER -p$DBPASS -Nse 'show tables' $DBNAME | while read table; do mysql -u$DBUSER -p$DBPASS -e "drop table $table" $DBNAME; done
