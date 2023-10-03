FROM python:3.11.6-alpine@sha256:3e73c0b6c1f0205225359acac5c8ab1852e7281248d72afda3e1bb8c6f47deab as base
LABEL maintainer "DeadNews <aurczpbgr@mozmail.com>"

ENV PIP_DEFAULT_TIMEOUT=100 \
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
    POETRY_DYNAMIC_VERSIONING_COMMANDS="" \
    # Maunt as dedicated RUN cache.
    POETRY_CACHE_DIR=\cache\poetry \
    PIP_CACHE_DIR=\cache\pip

RUN --mount=type=cache,target=${PIP_CACHE_DIR} \
    pip install "poetry==${POETRY_VERSION}"

COPY pyproject.toml poetry.lock README.md src ./
RUN --mount=type=cache,target=${POETRY_CACHE_DIR} \
    poetry install --only=main --no-root && \
    poetry build

FROM base as runtime

ENV UVICORN_PORT=8000 \
    UVICORN_HOST=0.0.0.0 \
    PATH="/app/.venv/bin/:$PATH"

COPY --from=py-builder /app/.venv /app/.venv
COPY --from=py-builder /app/dist /app/

RUN pip install /app/*.whl

USER guest:users
EXPOSE ${UVICORN_PORT}
HEALTHCHECK --interval=60s --timeout=3s \
     CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:${UVICORN_PORT}/health || exit 1

CMD [ "python", "-m", "uvicorn", "deadnews_template_python.app:app" ]
