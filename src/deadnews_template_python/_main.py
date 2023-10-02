#!/usr/bin/env python
"""Entrypoint for app."""
import uvicorn

from deadnews_template_python.app import app


def main() -> None:
    """
    Starts the Uvicorn server using the FastAPI application.

    You can also configure Uvicorn using environment variables with the prefix UVICORN_.
    """
    uvicorn.run(app, host="127.0.0.1", port=1271)
