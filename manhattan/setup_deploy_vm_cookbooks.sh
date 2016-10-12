#!/usr/bin/env bash

PACKAGE=manhattan.tar.gz

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
berks package ${PACKAGE}
mv ${PACKAGE} ../deploy/vm
cd ../deploy/vm;tar xvf ${PACKAGE};rm ${PACKAGE}
