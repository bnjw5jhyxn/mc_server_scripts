#!/usr/bin/sh
readonly backup_filename=$MINECRAFT_HOURLY_BACKUP_DIR/backup_$(date --utc +%Y%m%d_%H%M%S).tar.gz
readonly unmined_dir=/opt/minecraft/unmined
readonly apache_dir=/var/www/html

cd $MINECRAFT_DIR
mcrcon save-off save-all
sleep 60

if ! tar czvf $backup_filename world
then
	echo "failed to create backup"
	rm --verbose $backup_filename
fi

cd $unmined_dir

for dimension in overworld nether end
do
	nice ./unmined-cli web render --dimension=$dimension --zoomin=2 --mapsettings=./mapsettings/$dimension.json --world=$MINECRAFT_DIR/world --output=$apache_dir/$dimension
done

mcrcon save-on

cd $MINECRAFT_HOURLY_BACKUP_DIR
ls --reverse | tail --lines=+4 | xargs -I {} rm --verbose -- {}
