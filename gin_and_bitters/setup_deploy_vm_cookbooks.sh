#!/usr/bin/env bash

PACKAGE=gin_and_bitters.tar.gz

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
berks package ${PACKAGE}
mv ${PACKAGE} ../deploy/vagrant
cd ../deploy/vagrant;tar xvf ${PACKAGE};rm ${PACKAGE}
