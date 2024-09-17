#!/bin/bash
## install grub
sudo cp $ants/media/tard.jpg /boot/grub/tard.jpg; 
sudo mv /etc/default/grub /etc/default/grub_$(date +%y%m%d_%H%M)
printf '
GRUB_BACKGROUND="/boot/grub/tard.jpg"
GRUB_MENU_BACKGROUND="/boot/grub/tard.jpg"
GRUB_MENU_PICTURE="/boot/grub/tard.jpg"
GRUB_GFXMODE="2880x1800x32"
GRUB_GFXMODE="auto"
GRUB_DEFAULT="saved"
GRUB_SAVEDEFAULT="true"
GRUB_TIMEOUT_STYLE="menu"
GRUB_TIMEOUT="4"
GRUB_DISTRIBUTOR="`lsb_release -dcs|tail -n2|tr "\n" " " 2>/dev/null || echo Debian`"
GRUB_DISABLE_OS_PROBER="false"
GRUB_HIDDEN_TIMEOUT="0"
GRUB_CMDLINE_LINUX="console"
GRUB_GFXPAYLOAD_LINUX="keep"
GRUB_COLOR_NORMAL="cyan/magenta"
GRUB_COLOR_HIGHLIGHT="magenta/cyan"
GRUB_TERMINAL_OUTPUT="gfxterm"
GRUB_CMDLINE_LINUX_DEFAULT="console"
GRUB_FONT="/boot/grub/fonts/unicode.pf2"
' > /tmp/grub
sudo mv /tmp/grub /etc/default/grub
sudo update-grub; 
