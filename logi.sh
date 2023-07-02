#!/bin/bash

# Device settings.
# Use `hidapitester --list-detail` to find out your device values. If multiple listed, pick first.
LOGI_VID=046D
# MX Master S3
MSE_PID=B023
# MX Keys Mini
KYB_PID=B369

# Arguments
while getopts m:k:a: flag
do
  case "${flag}" in
    # -m for mouse channel 1-3
    m) MSE_CHANNEL=${OPTARG};;
    # -k for keyboard channel 1-3
    k) KYB_CHANNEL=${OPTARG};;
    # -a for both mouse and keyboard channel
    a)
      MSE_CHANNEL=${OPTARG}
      KYB_CHANNEL=${OPTARG}
      ;;
  esac
done

# Switch mouse to the selected channel
if [ -z ${MSE_CHANNEL+x} ];
  then :
  # MX Master S3, other devices not tested.
  else hidapitester -v --vidpid ${LOGI_VID}:${MSE_PID} --usagePage 0x0001 --usage 0x0006 --open --length 20 --send-output "0x11,0x00,0x0A,0x1E,0x0$(($MSE_CHANNEL-1)),0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00"; fi

# Switch keyboard to selected channel
if [ -z ${KYB_CHANNEL+x} ];
  then :
  # MX Keys Mini, other devices not tested.
  else hidapitester -v --vidpid ${LOGI_VID}:${KYB_PID} --usagePage 0x0001 --usage 0x0006 --open --length 20 --send-output "0x11,0x00,0x09,0x1E,0x0$(($KYB_CHANNEL-1)),0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00"; fi

exit 0
