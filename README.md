MySQL-to-git
============

Using cron, schedule automated MySQL database backups to git

I like this approach because I don't have to cleanup or version files on my system

One caveat: if you're using github or bitbucket, this approach is probably only appropriate for databases < 50mb

### Instructions

1. Create repo on github or bitbucket
2. `cd /dir/outside/webroot`
3. `git clone git@bitbucket.org:user/new_repo.git`
4. `export BACKUP_DIR=/dir/outside/webroot/new_repo`
5. Define environment variables for DB_USER, DB_PW, DB_NAME
6. Save file and add to crontab
7. `chmod 600 git-db-backup.sh`

