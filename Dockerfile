FROM python:3.12.2-alpine@sha256:1a0501213b470de000d8432b3caab9d8de5489e9443c2cc7ccaa6b0aa5c3148e as base
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
ENV POETRY_VERSION="1.8.2"
ENV POETRY_VIRTUALENVS_IN_PROJECT=1 \
    # Disable the dynamic versioning.
    POETRY_DYNAMIC_VERSIONING_COMMANDS="" \
    # Maunt as dedicated RUN cache.
    POETRY_CACHE_DIR="/cache/poetry" \
    PIP_CACHE_DIR="/cache/pip"

# Install poetry.
RUN --mount=type=cache,target=${PIP_CACHE_DIR} \
    pip install "poetry==${POETRY_VERSION}"

# Install gcc for building wheels. Alpine.
RUN --mount=type=cache,target="/var/cache/" \
    --mount=type=cache,target="/var/lib/apk/" \
    apk add gcc

# Install dependencies and build wheels.
COPY pyproject.toml poetry.lock README.md src ./
RUN --mount=type=cache,target=${POETRY_CACHE_DIR} \
    poetry install --only=main --no-root && \
    poetry build

FROM base as runtime

ENV UVICORN_PORT=8000 \
    UVICORN_HOST=0.0.0.0 \
    PATH="/app/.venv/bin/:$PATH"

COPY --from=py-builder /app/.venv /app/.venv
COPY --from=py-builder /app/dist/*.whl /app/

RUN pip install /app/*.whl

USER guest:users
EXPOSE ${UVICORN_PORT}
HEALTHCHECK --interval=60s --timeout=3s \
    CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:${UVICORN_PORT}/health || exit 1

CMD [ "python", "-m", "uvicorn", "deadnews_template_python:app" ]
