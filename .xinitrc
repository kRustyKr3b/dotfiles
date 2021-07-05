userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

wal -R &
albert &
dunst &
nm-applet &

xset r rate 200 30 &
xset -b &
	#LAYOUT="$( [[ (xset -q | grep -A 0 'LED' | cut -c59-67) ]] && echo "US" || echo "MK")"
while true
do
	VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
	LOCALTIME=$(date "+%H:%M:%S")
	LOCALDATE=$(date "+%a, %d.%m")
	IP=$(ip addr show wlp1s0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 | cut -d. -f3-4) 
	IPE=$(ip addr show enp2s0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1 | cut -d. -f3-4)
	TEMP=$(sensors | awk '/temp1/ {print $2}' | cut -c2-5)
	BAT=$(acpi | awk '{print $4}' | cut -d, -f1)
	DISCC=$(df -h | awk '/sda1/ {print $5}')
	
	xsetroot -name "[󱛟$DISCC][󰕾$VOL][󰔏$TEMP][󰤥$IP][󰀂$IPE][$(/home/shaolinrus/scripts/infoBat.sh)$BAT][$(/home/shaolinrus/scripts/layout.sh)][󱑍$LOCALTIME|$LOCALDATE]"
	sleep 1
done &

exec dwm
