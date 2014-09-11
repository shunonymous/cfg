#!/sbin/sh
VERSION=v1.3
if [ ! -e /system/etc/uber_$VERSION.cfg ] || [ -e /sdcard/.reset_cfg ]; then
	if grep -q uber.cfg /system/build.prop; then
		sed -i 's/uber.cfg=dirty/uber.cfg=clean/g' /system/build.prop
		sed -i 's/uber.cfg=none/uber.cfg=clean/g' /system/build.prop
	else
		echo " " >> /system/build.prop
		echo "uber.cfg=clean" >> /system/build.prop
	fi
elif [ -e /sdcard/.no_cfg ]; then
	if grep -q uber.cfg /system/build.prop; then
		sed -i 's/uber.cfg=dirty/uber.cfg=none/g' /system/build.prop
		sed -i 's/uber.cfg=clean/uber.cfg=none/g' /system/build.prop
	else

		echo "uber.cfg=none" >> /system/build.prop
	fi
else
	if grep -q uber.cfg /system/build.prop; then
		sed -i 's/uber.cfg=clean/uber.cfg=dirty/g' /system/build.prop
		sed -i 's/uber.cfg=none/uber.cfg=dirty/g' /system/build.prop
	else
		echo " " >> /system/build.prop
		echo "uber.cfg=dirty" >> /system/build.prop
	fi
fi
