#!/system/bin/sh

# Remove bind-mount of phh-su
mount -o rw,remount /
umount -l /system/xbin/su
umount -l /system/bin/magisk

# Nuke
rm /system/xbin/su
rm /system/bin/phh-su
rm /system/etc/init/su.rc
rm /system/bin/phh-root.sh
rm -rf /system/priv-app/SuperUser
rm /system/bin/phh-securize.sh
rm -rf /data/su || true
mount -o ro,remount /
sync
reboot
