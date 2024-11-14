FROM python:3.13.0-alpine@sha256:fcbcbbecdeae71d3b77445d9144d1914df55110f825ab62b04a66c7c33c09373 AS base
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
ENV POETRY_VERSION="1.8.4"
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
HEALTHCHECK NONE

CMD [ "python", "-m", "uvicorn", "deadnews_template_python:app" ]
