#!/usr/bin/env bash
# Update ALSA_CONFIG if you get the "Wrong File!" error with the value of the find command provided.
ALSA_CONFIG=/usr/share/alsa-card-profile/mixer/paths/analog-output.conf.common
ALSA_EXISTS=$(grep "Element Master" < $ALSA_CONFIG)
if [ -f $ALSA_CONFIG ]; then
    if ([ -z "$ALSA_EXISTS" ]); then
	sudo sed -i "/Element PCM/i[Element Master]\nswitch = mute\nvolume = ignore\n" /usr/share/alsa-card-profile/mixer/paths/analog-output.conf.common
	echo "Audio file patched!"
    else
	echo "Your audio file has already been patched!"
    fi
else
    echo -e "Wrong File! If your audio works, but you can only set it to 0 or 100, you can try the above script again. Run the command \"sudo find / -type f -name analog-output.conf.common\""
fi
