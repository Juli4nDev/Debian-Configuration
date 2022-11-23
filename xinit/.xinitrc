xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96

xsetroot -cursor_name left-ptr
xset r rate 200 60

emacs --fg-daemon &

exec dbus-launch --exit-with-session leftwm
