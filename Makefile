install:
	poetry install --sync

lint:
	poetry run poe lint

test:
	poetry run pytest

poetry-up:
	poetry up --latest

pre-commit-install:
	pre-commit install

pre-commit-up:
	pre-commit autoupdate

pre-commit-run:
	pre-commit run -a
