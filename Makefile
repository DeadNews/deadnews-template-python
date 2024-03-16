.PHONY: all clean test checks docs run

install-all: install pc-install

install:
	poetry install --sync

pc-install:
	pre-commit install

update-latest:
	poetry up --latest

checks: pc-run install lint test

pc-run:
	pre-commit run -a

lint:
	poetry run poe lint

test:
	poetry run poe test

docs:
	poetry run mkdocs serve

run:
	poetry run uvicorn --reload deadnews_template_python:app
