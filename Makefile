.PHONY: test

install-all: install pc-install

install:
	poetry install --sync

pc-install:
	pre-commit install

update:
	poetry update

update-latest:
	poetry up --latest

checks: pc-run lint test

pc-run:
	pre-commit run -a

lint:
	poetry run poe lint

test:
	poetry run pytest
