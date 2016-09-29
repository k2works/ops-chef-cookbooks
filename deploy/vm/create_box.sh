#!/bin/bash

set -e

#export PACKER_LOG=1
rm ./box/dev-env.box || true
#エラー時はvagrant plugin install vagrant-exec
vagrant exec sudo ln -s -f /dev/null /etc/udev/rules.d/70-persistent-net.rules
vagrant package -o ./box/dev-env.box