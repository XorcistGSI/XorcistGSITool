# Vendor overlays
mount -o bind /system/labubu/vo /vendor/overlay || true
mount -o bind /system/labubu/group /vendor/etc/group || true
mount -o bind /system/labubu/passwd /vendor/etc/passwd || true
