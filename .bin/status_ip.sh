#!/bin/bash

echo $(ifconfig en0 | grep "inet " | awk '{print $2}') / $(wget -qO - icanhazip.com)
