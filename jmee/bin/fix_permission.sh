#!/bin/sh
#
# Copyright (c) 2014, Oracle and/or its affiliates. All rights reserved.
#

# Fix permissions for correct functionality without sudo

cd ${0%/*}
echo sets +x for all .sh
chmod +x ./*.sh

echo sets +x for runMidlet
chmod +x ./runMidlet*

#some platforms like Intel Galileo does not have sudo command
sudopath=$(which sudo) 
if [ "$sudopath" != "" ]; then
  echo sets CAP_DAC_OVERRIDE,CAP_SETGID and CAP_NET_ADMIN capabilities to runMidlet
  sudo setcap cap_dac_override,cap_net_admin,cap_setgid+ep ./runMidlet
fi
