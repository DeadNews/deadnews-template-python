FROM python:3.13.5-alpine@sha256:9b4929a72599b6c6389ece4ecbf415fd1355129f22bb92bb137eea098f05e975 AS base
LABEL maintainer="DeadNews <deadnewsgit@gmail.com>"

# No .pyc files, tracebacks, real-time logs
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

FROM base AS builder

ENV UV_CACHE_DIR="/cache/uv" \
    UV_COMPILE_BYTECODE=1 \
    UV_DYNAMIC_VERSIONING_BYPASS=1 \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=0

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/

# Install project
COPY pyproject.toml uv.lock README.md src ./
RUN --mount=type=cache,target=${UV_CACHE_DIR} \
    uv sync --locked --no-dev

FROM base AS runtime

ENV UVICORN_PORT=8000 \
    UVICORN_HOST=0.0.0.0 \
    PATH="/app/.venv/bin:$PATH"

COPY --from=builder /app /app

USER guest:users
EXPOSE ${UVICORN_PORT}
HEALTHCHECK NONE

CMD [ "python", "-m", "uvicorn", "deadnews_template_python:app" ]
