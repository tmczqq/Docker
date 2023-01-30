#!/usr/bin/env bash

set -e

source_dir="$(dirname "$0")"
source "${source_dir}/../../source/font.sh"

echo-info "Cleaing"

apt-get clean 
rm -rf /var/cache/apt/archives/* \
       /var/lib/apt/lists/* \
       /tmp \
       /var/tmp/

