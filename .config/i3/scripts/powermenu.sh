#!/bin/sh



function command_exists() {
   command -v "$1" &> /dev/null 2>&1
}

if ! command_exists systemctl; then
   notify-send "Systemctl does not exist"
   exit 1
fi 



declare -a options      ; declare -A cmds
options[0]=" Cancel"   ; cmds[${options[0]}]=""
options[1]=" Lock"     ; cmds[${options[1]}]="~/.config/i3/scripts/lock.sh"
options[2]=" Hibernate"; cmds[${options[2]}]="systemctl hibernate"
options[3]=" Suspend"  ; cmds[${options[3]}]="systemctl suspend"
options[4]=" Logout"   ; cmds[${options[4]}]="i3-msg exit"
options[5]=" Reboot"   ; cmds[${options[5]}]="systemctl reboot"
options[6]=" Shutdown" ; cmds[${options[6]}]="systemctl poweroff"

choices=""
for key in "${options[@]}"; do
   if [ "$choices" == "" ]; then
      choices="$key"
   else
      choices="$choices\n$key"
   fi
done

# choices=" Shutdown\n Reboot\n Suspend\n Hibernate\n Lock\n Logout\n Cancel"


DMENU='dmenu'
choice=$(echo -e $choices | $DMENU)
echo $choice
echo ${cmds[$choice]}

${cmds[$choice]}
#case "$choice" in
#  logout) i3-msg exit & ;;
#  shutdown) sudo shutdown -h now & ;;
#  reboot) sudo shutdown -r now & ;;
#  suspend) sudo pm-suspend & ;;
#  hibernate) sudo pm-hibernate & ;;
#esac
