#!/bin/bash

set -e
BOX=gin_and_bitters

# vagrant box remove dev-env --all || true
vagrant box add $BOX metadata.json
