




if [ "$TERMUX_APP_PID" ]; then 
a_manu="$(getprop ro.product.manufacturer)"; a_cpu="$(getprop ro.product.cpu.abi)"; a_vers="$(getprop ro.product.build.version.release_or_codename)"; a_model="$(getprop ro.product.model)"; a_device="$(getprop ro.product.device)"; printf "\n${re}[${dim}${a_model}${re}] $a_manu$dim --$re $a_cpu$dim -- $re${a_device}$dim [$re${a_vers}${dim}]";  
else printf ""; fi 
