.PHONY: install test

install:
	poetry install --sync

lint:
	poetry run poe lint

test:
	poetry run pytest

pc-run:
	pre-commit run -a

pc-install:
	pre-commit install

pc-up:
	pre-commit autoupdate

poetry-up:
	poetry up --latest
