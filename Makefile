.PHONY: all clean test checks pc update docs run

install:
	pre-commit install
	poetry install --sync

update:
	poetry up --latest

checks: pc install lint test

pc:
	pre-commit run -a

lint:
	poetry run poe lint

test:
	poetry run poe test

docs:
	poetry run mkdocs serve

run:
	poetry run uvicorn --reload deadnews_template_python:app
