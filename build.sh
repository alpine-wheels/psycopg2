#!/bin/sh

set -e

# install os dependencies
apk add --no-cache gcc git musl-dev postgresql-dev

# find version
PSYCOPG2_TAG="$(awk -F '==' '/psycopg2/ { gsub(/\./, "_", $2) ; print $2 }' requirements.txt)"

# check out source code
rm -rf psycopg2
git config --global advice.detachedHead false
git clone --branch "${PSYCOPG2_TAG}" --depth 1 https://github.com/psycopg/psycopg2.git

# build
cd psycopg2 || exit
python setup.py bdist_wheel
