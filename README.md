was forked from istepanov/pg_dump
================
Add PGHOST and PGDATABASE variables, fix typo

Docker image with pg_dump running as a cron task

### Usage

Attach a target postgres container to this container and mount a volume to container's `/dump` folder. Backups will appear in this volume. Optionally set up cron job schedule (default is `0 1 * * *` - runs every day at 1:00 am).

    docker run -d \
        -v /path/to/target/folder:/dump \   # where to put db dumps
        -e 'CRON_SCHEDULE=0 1 * * *' \      # cron job schedule
        -e PGUSER=postgres \
        -e PGPASSWORD=my_secret_password \
        -e PGHOST=postgres_host
        -e PGDATABASE=db_name_to_back_up
        --link my-postgres-container \   # linked container with running postgres
        istepanov/pg_dump dump-cron

Run backup once without cron job, use "mybackup" as backup file prefix, shell will ask for password:

    docker run -ti --rm \
        -v /path/to/target/folder:/dump \   # where to put db dumps
        -e PREFIX=mybackup \
        --link my-postgres-container \   # linked container with running postgres
        istepanov/pg_dump dump
