FROM python:3.11-alpine@sha256:25df32b602118dab046b58f0fe920e3301da0727b5b07430c8bcd4b139627fdc as base
LABEL maintainer "DeadNews <aurczpbgr@mozmail.com>"

ENV PIP_NO_CACHE_DIR=1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    # Avoid to write .pyc files.
    PYTHONDONTWRITEBYTECODE=1 \
    # Allow messages to immediately appear.
    PYTHONUNBUFFERED=1 \
    # Tracebacks on segfaults.
    PYTHONFAULTHANDLER=1

WORKDIR /app

FROM base as py-builder

# renovate: datasource=pypi dep_name=poetry
ENV POETRY_VERSION="1.6.1"
ENV POETRY_VIRTUALENVS_IN_PROJECT=1 \
    # Disable the dynamic versioning.
    POETRY_DYNAMIC_VERSIONING_COMMANDS=""

RUN pip install "poetry==${POETRY_VERSION}"

COPY pyproject.toml poetry.lock README.md src ./
RUN poetry install --only=main --no-root && \
    poetry build

FROM base as runtime

ENV PATH="/app/.venv/bin/:$PATH"

COPY --from=py-builder /app/.venv ./.venv
COPY --from=py-builder /app/dist .

RUN pip install *.whl

USER guest
HEALTHCHECK NONE

ENTRYPOINT [ "python", "-m", "deadnews_template_python" ]
