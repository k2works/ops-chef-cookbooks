#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
berks package martini.tar.gz
mv martini.tar.gz ../deploy/vm
rm -rf ../deploy/vm/cookbooks
cd /vagrant/deploy/vm;tar xvf martini.tar.gz;rm martini.tar.gz
