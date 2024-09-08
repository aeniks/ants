#!/bin/bash
## login chooser
hey() {
unset rep; unset crep;  
[ "$TMUX" ]&& return; 
[ "$ok" ]&& return; unset ok;
local re='\x1b[0m' dim='\x1b[2m' cyan='\x1b[36m' green='\x1b[32m' pink='\x1b[35m';
echo;
batcat /etc/issue.net -fppl c 2>/dev/null;
printf "\
  [${cyan}t${re}]${dim}mux\t  ${re}[${cyan}f${re}]${dim}ilemanager${re}
  [${cyan}d${re}]${dim}ate${re}\t  ${re}[${cyan}s${re}]${dim}hell${re}
  [${cyan}x${re}]${dim}dextop${re}\t  ${re}[${cyan}k${re}]${dim}lock\n\n"; 
read -t4 -n1 -resp "" "rep"||rep=k; 
case "$rep" in
"") rep="smell"; crep="echo gg";;
t) rep="tmux"; crep="tmux";;
f) rep="filemanager"; crep="lf";;
l) rep="filemanager"; crep="lf";;
d) rep="date"; crep="date";;
s) rep="smell"; crep="echo aa";;
x) rep="dextop"; crep="startx";;
k) rep="klock"; crep="klock";;
esac
printf "  ${dim}${rep} ${re}[${green}${dim}ok${re}]\n";
$crep; 
printf "\n"; 
ok=1; 
return;
}
