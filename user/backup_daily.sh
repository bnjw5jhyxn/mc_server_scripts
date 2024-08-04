#!/usr/bin/sh
cd $MINECRAFT_DAILY_BACKUP_DIR
readonly hourly_backup_file=$(ls --reverse $MINECRAFT_HOURLY_BACKUP_DIR | head --lines=1)
cp --no-clobber -- $MINECRAFT_HOURLY_BACKUP_DIR/$hourly_backup_file .
ls --reverse | tail --lines=+6 | xargs -I {} rm --verbose -- {}
