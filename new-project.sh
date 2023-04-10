#!/usr/bin/env bash

set -eu

curl -sSL https://install.python-poetry.org | python3 -
export PATH="/root/.local/bin:$PATH"

rm -rf $PROJECT_NAME

poetry new $PROJECT_NAME

cd $PROJECT_NAME
python -m venv ./.venv
export PATH="$(pwd)/.venv/bin:$PATH"
poetry add pytest pytest-cov pylint pytest-picked pytest-sugar pytest-xdist --group test

cp -r ../assets/. .

pylint --generate-rcfile > ./.pylintrc
echo -e "\n[CUSTOM]\n\ndisable=missing-module-docstring,missing-function-docstring" >> ./.pylintrc
