#!/usr/bin/env bash

curl -sSL https://install.python-poetry.org | python3 -
export PATH="/root/.local/bin:$PATH"

rm -rf $PROJECT_NAME

poetry new $PROJECT_NAME

cd $PROJECT_NAME
python -m venv ./.venv
poetry add pytest pytest-cov pylint pytest-picked pytest-sugar pytest-xdist --group test
export PATH="$(pwd)/.venv/bin:$PATH"

cp -r ../assets/ .

pylint --generate-rcfile > ./.pylintrc
echo "[CUSTOM]\n\ndisable=missing-module-docstring,missing-function-docstring\n" >> ./.pylintrc
