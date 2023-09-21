FROM python:3.11.5-alpine@sha256:5d769f990397afbb2aca24b0655e404c0f2806d268f454b052e81e39d87abf42 as base
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

ENV PATH="/app/.venv/bin/:$PATH"

COPY --from=py-builder /app/.venv /app/.venv
COPY --from=py-builder /app/dist /app/

RUN pip install /app/*.whl

USER guest:users
HEALTHCHECK NONE

ENTRYPOINT [ "python", "-m", "deadnews_template_python" ]
