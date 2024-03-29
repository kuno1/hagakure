#!/usr/bin/env bash

set -ex

# Set variables.
PREFIX="refs/tags/"
VERSION=${1#"$PREFIX"}

echo "Building Plugin v${VERSION}..."


composer install --no-dev --prefer-dist

# Create readme.txt
curl -L https://raw.githubusercontent.com/fumikito/wp-readme/master/wp-readme.php | php

# Change version string.
sed -i.bak "s/Version: .*/Version: ${VERSION}/g" ./hagakure.php
sed -i.bak "s/^Stable Tag: .*/Stable Tag: ${VERSION}/g" ./readme.txt

