#!/bin/bash

link="◯"
public_ip=""
local_ip="offline"

if [ "$(netcheck.sh)" = "ON" ]; then
  link="⇅"
  public_ip=$(wget -qO - icanhazip.com)
fi

local_iface=$(ifconfig $1 | grep 'inet ')
if [ "$local_iface" != "" ]; then
  local_ip=$(echo "$local_iface" | awk '{print $2}')

  if [ "$public_ip" != "" ]; then
    local_ip="$local_ip / "
  fi
fi

echo "#[fg=colour245,bg=colour0] $link ${local_ip}${public_ip}"
