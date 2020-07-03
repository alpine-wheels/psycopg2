#!/bin/sh

set -e

# install os dependencies
apk add --no-cache gcc musl-dev postgresql-dev

# build
pip wheel --requirement requirements.txt
