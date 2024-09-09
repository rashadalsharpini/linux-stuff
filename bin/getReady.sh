setxkbmap -layout us,ara -option grp:alt_shift_toggle
xmodmap -e "keycode 135 = Super_R"
setxkbmap -option caps:escape
variety &
xfce4-clipman &
xmodmap ~/.Xmodmap
