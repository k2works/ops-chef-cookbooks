#!/usr/bin/env bash

PACKAGE=rails_demo.tar.gz

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
berks package ${PACKAGE}
mv ${PACKAGE} ../
