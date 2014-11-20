MySQL-to-git
============

Using cron, schedule automated MySQL database backups to git

I like this approach because I don't have to cleanup or version files on my system, and yet 

### Instructions

1. Replace {DB_USERNAME}, {DB_PASSWORD}, AND {DB_NAME} tags (removing curly braces) in git-db-backup.sh
2. Create {REPO_NAME} on github or bitbucket and replace {REPO_NAME} in git-db-backup.sh
3. `cd /some/directory/outside/webroot`
4. `git clone git@github.com:{GIT_USERNAME}/{REPO_NAME}.git`
5. `cd {new_repo}`
6. `pwd` and replace {/FULLY/QUALIFIED/PATH/TO/BACKUP/DIR} with result
7. Save file and place git-db-backup.sh file in /etc/cron.daily/ or add to crontab
8. `chmod 600 git-db-backup.sh`
9. (Optional) test script `bash git-db-backup.sh`


