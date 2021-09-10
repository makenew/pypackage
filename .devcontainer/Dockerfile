ARG PYTHON_VERSION="3"

FROM mcr.microsoft.com/vscode/devcontainers/python:${PYTHON_VERSION}

USER vscode

ARG POETRY_VERSION="1.1.8"
ARG POETRY_SRC="https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py"

WORKDIR /home/vscode

RUN curl -fsSL "${POETRY_SRC}" > install-poetry.py \
 && python install-poetry.py --version $POETRY_VERSION \
 && rm install-poetry.py

RUN mkdir -p .config/git \
 && echo ".vscode/*" >> .config/git/ignore \
 && echo "*.code-workspace" >> .config/git/ignore \
 && echo ".history/" >> .config/git/ignore
