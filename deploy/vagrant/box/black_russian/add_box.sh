#!/bin/bash

set -e
BOX=black_russian

# vagrant box remove dev-env --all || true
vagrant box add $BOX metadata.json
