FROM python:3.12.4-alpine@sha256:0bd77ae937dce9037e136ab35f41eaf9e012cfd741fc3c8dd4b3e2b63499f12c AS base
LABEL maintainer="DeadNews <deadnewsgit@gmail.com>"

ENV PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    # Avoid to write .pyc files.
    PYTHONDONTWRITEBYTECODE=1 \
    # Allow messages to immediately appear.
    PYTHONUNBUFFERED=1 \
    # Tracebacks on segfaults.
    PYTHONFAULTHANDLER=1

WORKDIR /app

FROM base AS py-builder

# renovate: datasource=pypi dep_name=poetry
ENV POETRY_VERSION="1.8.3"
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

FROM base AS runtime

ENV UVICORN_PORT=8000 \
    UVICORN_HOST=0.0.0.0 \
    PATH="/app/.venv/bin/:$PATH"

COPY --from=py-builder /app/.venv /app/.venv
COPY --from=py-builder /app/dist/*.whl /app/

RUN pip install /app/*.whl

USER guest:users
EXPOSE ${UVICORN_PORT}
HEALTHCHECK --interval=1m --retries=3 --timeout=10s --start-period=1m \
    CMD wget --no-verbose --tries=1 --spider http://127.0.0.1:${UVICORN_PORT}/health || exit 1

CMD [ "python", "-m", "uvicorn", "deadnews_template_python:app" ]
