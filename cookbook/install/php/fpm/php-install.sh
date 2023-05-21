#!/usr/bin/env bash

set -e

source_dir="$(dirname $(readlink -f "$0"))"
source ${source_dir}/../../source/font.sh

cp -R "${source_dir/files/service}" /

PHP_VERSION="${1}"

echo-info "Installing PHP"

# for versions < 7.4 and >= 8.0
VERSION=$(echo "${PHP_VERSION}" | tr -cd '0-9')
if [ "${VERSION}" -lt "74" ] || [ "${VERSION}" -ge "80" ]; then
    add-apt-repository ppa:ondrej/php
fi

apt-get -y update
apt-get -y install --no-install-recommends "php${PHP_VERSION}" \
                                           "php${PHP_VERSION}-fpm"
update-alternatives --set php "/usr/bin/php${PHP_VERSION}"

sed -i "s/<PHP_VERSION>/${PHP_VERSION}/g" "/service/php/run"