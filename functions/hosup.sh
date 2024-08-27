hosup() {
arp -n|grep -v "incomplete"

host="192.168.0.1"; for i in $(seq -w 00 20); do ping ${host}${i} -W .2 -qACc1 &>/dev/null && echo -e "host ${dim}${host}\e[1;4m$i\e[0m is$green up"$re; done
}
