#!/bin/bash
# backup a MySQL database to a git repo
# remember to chmod 600 this file
/bin/date
/usr/bin/mysqldump --add-drop-table -h localhost -u {DB_USERNAME} -p{DB_PASSWORD} {DB_NAME} > {/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR/}db-backup.sql
datestamp=`date +'%Y-%m-%d'`
/usr/bin/git --git-dir={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR/}.git --work-tree={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR/} add {/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR/}db-backup.sql
/usr/bin/git --git-dir={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR/}.git --work-tree={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR/} commit -m "\"$datestamp backup."\"
/usr/bin/git --git-dir={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR/}.git --work-tree={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR/} push --verbose -u {REPO_NAME} master