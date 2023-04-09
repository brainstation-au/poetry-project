FROM python:3.10-buster

ENV CODE=/opt/code
WORKDIR ${CODE}

ENV VENV_PATH="${CODE}/.venv"
ENV PATH="${VENV_PATH}/bin:${PATH}"

RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="${PATH}:/root/.local/bin"
