xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96

xsetroot -cursor_name left_ptr
xset r rate 200 60

export VISUAL="emacsclient -c -a emacs"
export EDITOR="emacsclient -t"

exec dbus-launch --exit-with-session leftwm
