# Variables
screensConnected=()
configPath=/etc/X11/xorg.conf.d/10-monitor.conf

# Force sudo on all commands
if [ "#(id -u)" != "0"]; then
  exec sudo "$0" "$@"
fi

# Create array of connected devices

for ID in $(xrandr | grep -w 'connected' | awk '{print $1;}'); do
  screensConnected+=($ID)
done

# Make sure the old file is deleted and a new empty one is generated
rm $configPath
touch $configPath

# Generate primary screen on first run through and then add screens to the right
for i in "${!screensConnected[@]}"; do
if [ $i = 0 ]; then
echo "Section \"Monitor\"
  Identifier \"${screensConnected[$i]}\"
  Option \"Primary\" \"true\"
EndSection" >> $configPath
else
screenBefore=$i-1
echo "Section \"Monitor\"
  Identifier \"${screensConnected[$i]}\"
  Option \"RightOf\" \"${screensConnected[$screenBefore]}\"
EndSection" >> $configPath
fi
done
