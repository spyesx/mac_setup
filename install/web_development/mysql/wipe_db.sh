#!/bin/bash

# Backup & Wipe a database
# sudo sh wipe_db.sh dbname

DBUSER="xxxxxxxxxxxx"
DBPASS="yyyyyyyyyyyyyy"
DBNAME="$1"

# Require the database argument.
[ $# -eq 0 ] && {
  echo "Please specify a valid MySQL database: $0 [database_goes_here]" ;
  exit 1;
}

echo "Create a backup of $DBNAME"
mysqldump -u$DBUSER -p$DBPASS $DBNAME > "$DBNAME.sql"

echo "Drop $DBNAME"
mysql -u$DBUSER -p$DBPASS -Nse 'show tables' $DBNAME | while read table; do mysql -u$DBUSER -p$DBPASS -e "drop table $table" $DBNAME; done
