FROM python:3.11@sha256:cc7372fe4746ca323f18c6bd0d45dadf22d192756abc5f73e39f9c7f10cba5aa AS python-builder
LABEL maintainer "DeadNews <aurczpbgr@mozmail.com>"

# renovate: datasource=pypi dep_name=poetry
ENV POETRY_VERSION="1.6.1"
# renovate: datasource=pypi dep_name=poetry-dynamic-versioning
ENV DYNAMIC_VERSIONING_VERSION="1.0.1"
ENV POETRY_VIRTUALENVS_IN_PROJECT=true

RUN pip install --no-cache-dir \
    poetry==${POETRY_VERSION} \
    poetry-dynamic-versioning[plugin]==${DYNAMIC_VERSIONING_VERSION}

WORKDIR /tmp/app
COPY . ./
RUN python -m poetry install --only main

#
FROM gcr.io/distroless/python3-debian11@sha256:5148968d8ae02a0f6d12efaca7a16e711ab43a4695a285e22dbbae70d6048937 AS final
LABEL maintainer "DeadNews <aurczpbgr@mozmail.com>"

COPY --from=python-builder /tmp/app/.venv /venv

USER nonroot:nonroot
HEALTHCHECK NONE

ENTRYPOINT [ "/venv/bin/python", "-m", "deadnews_template_python" ]
