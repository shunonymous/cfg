#!/sbin/sh
#
# /system/addon.d/95-uber.sh
#
VERSION=v1.3
. /tmp/backuptool.functions

list_files() {
cat <<EOF
etc/uber_$VERSION.cfg
etc/advanced_$VERSION.cfg
etc/uber_color_$VERSION.cfg
etc/volt_table_$VERSION.cfg
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
