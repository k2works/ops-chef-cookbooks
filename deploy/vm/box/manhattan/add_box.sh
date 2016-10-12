#!/bin/bash

set -e
BOX=manhattan

# vagrant box remove dev-env --all || true
vagrant box add $BOX metadata.json
