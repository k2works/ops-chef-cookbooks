#!/usr/bin/env bash

PACKAGE=rails_demo.tar.gz

aws s3 cp ${PACKAGE} s3://arc-opsworks-demo/${PACKAGE}
