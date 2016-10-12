#!/bin/bash

set -e
BOX=martini

# vagrant box remove dev-env --all || true
vagrant box add $BOX metadata.json
