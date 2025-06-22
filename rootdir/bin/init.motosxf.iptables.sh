#!/vendor/bin/sh
#
# iptables
#
# Copyright (c) 2022 Motorola Mobility LLC
# All Rights Reserved.
#
# Motorola Mobility Confidential Restricted.
#
# author: chengql2@motorola.com
# date: June 1, 2022
#

script_name=${0##*/}
script_name=${script_name%.*}
function log {
    echo "$script_name: $*" > /dev/kmsg
}

PROP_IPTABLES_OP=vendor.motosxf.iptables.op
PROP_IPTABLES_UID=vendor.motosxf.iptables.uid

iptables_op=$(getprop $PROP_IPTABLES_OP)
iptables_uid=$(getprop $PROP_IPTABLES_UID)

if [[ $iptables_op != "A" ]] && [[ $iptables_op != "D" ]]; then
    return 1
fi

if [ -z "${iptables_uid##*[!0-9]*}" ]; then
    return 1
fi

log "iptables -w -t mangle -$iptables_op oem_mangle_post -m owner --uid $iptables_uid -j TOS --set-tos 0xb8"
/system/bin/iptables-wrapper-1.0 -w -t mangle -$iptables_op oem_mangle_post -m owner --uid $iptables_uid -j TOS --set-tos 0xb8
return $?
