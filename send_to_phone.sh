#!/usr/bin/env bash

paired_devices="$(kdeconnect-cli -a --name-only)"

if ! [[ $paired_devices ]];then	

	notify-send "No paired devices"	

else
	notify-send "Sending Files to $(kdeconnect-cli -a --name-only)"
	for i in $@; do
		if [[ -d $i ]]; then
			find $i -maxdepth 1 -type f -name "*" -exec kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --share {} \;
		else
			kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --share $i
		fi
	done

fi