#!/bin/bash

set -eBOX_PATH=manhattan
VM_BOX=dev-env.box

#export PACKER_LOG=1
rm ./box/$BOX_PATH/$VM_BOX || true
#エラー時はvagrant plugin install vagrant-exec
vagrant exec sudo ln -s -f /dev/null /etc/udev/rules.d/70-persistent-net.rules
vagrant package -o ./box/$BOX_PATH/$VM_BOX
