#!/bin/bash
# backup a MySQL database to a git repo
# remember to chmod 600 this file
/bin/date
datestamp=`date +'%Y-%m-%d'`

# dump database
/usr/bin/mysqldump --add-drop-table -h localhost -u {DB_USERNAME} -p{DB_PASSWORD} {DB_NAME} > {/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR}/{DB_NAME}.bak.sql

# git add .sql file
/usr/bin/git --git-dir={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR}/.git --work-tree={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR} add {/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR}/{DB_NAME}.bak.sql

# git commit and push
/usr/bin/git --git-dir={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR}/.git --work-tree={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR} commit -m "\"$datestamp backup."\"
/usr/bin/git --git-dir={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR}/.git --work-tree={/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR} push --verbose -u origin master