#!/bin/bash
# backup a MySQL database to a git repo
# remember to chmod 600 this file
/bin/date
datestamp=`date +'%Y-%m-%d'`

# eg export MYSQL_BACKUP_USER=db_user
export DB_USER=

# eg export MYSQL_BACKUP_PW=$upers3cret!
export DB_PW=

# eg export DB_NAME=db_name
export DB_NAME=

# eg export BACKUP_DIR=/var/www/vhosts/example.com/private
export BACKUP_DIR=

# dump database
/usr/bin/mysqldump --add-drop-table -h localhost -u $DB_USER -p$DB_PW $DB_NAME > $BACKUP_DIR/$DB_NAME.bak.sql

# git add .sql file
/usr/bin/git --git-dir=$BACKUP_DIR/.git --work-tree=$BACKUP_DIR add $BACKUP_DIR/$DB_NAME.bak.sql

# git commit and push
/usr/bin/git --git-dir=$BACKUP_DIR/.git --work-tree=$BACKUP_DIR commit -m "\"$datestamp backup."\"
/usr/bin/git --git-dir=$BACKUP_DIR/.git --work-tree=$BACKUP_DIR push --verbose -u origin master
