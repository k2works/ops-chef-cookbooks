#!/bin/bash

set -e
BOX=balalaika

# vagrant box remove dev-env --all || true
vagrant box add $BOX metadata.json
