.PHONY: all clean test checks docker

install-all: install pc-install

install:
	poetry install --sync

pc-install:
	pre-commit install

update-latest:
	poetry up --latest

checks: pc-run install lint pyright test

pc-run:
	pre-commit run -a

lint:
	poetry run poe lint

test:
	poetry run poe test

pyright:
	poetry run poe pyright

docker: compose-up

compose-up:
	docker compose up --build

compose-down:
	docker compose down

run-reload:
	poetry run uvicorn --reload deadnews_template_python.app:app
