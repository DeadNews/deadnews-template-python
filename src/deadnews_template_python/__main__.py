"""Entrypoint for app, enables execution with `python -m deadnews_template_python`."""

import uvicorn


def main() -> None:
    """Starts the Uvicorn server using the FastAPI application.

    Note that the application instance itself can be passed instead of the app import string.
    However, this style only works if you are not using multiprocessing (workers=NUM) or reloading (reload=True).
    """
    uvicorn.run("deadnews_template_python:app")  # pragma: no cover


if __name__ == "__main__":
    main()
