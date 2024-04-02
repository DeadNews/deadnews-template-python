.PHONY: all clean default install lock update checks pc test docs run

default: checks

install:
	pre-commit install
	poetry install --sync

lock:
	poetry lock --no-update

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

get-next:
	git cliff --bumped-version

# make release-tag_name
# make release-v1.0.0-alpha.0
release-%: checks
	git cliff -o CHANGELOG.md --tag $*
	git add CHANGELOG.md
	git commit -m "chore(release): prepare for $*"
	git push
	git tag --sign -a $* -m "chore(release): $*"
	git push --tags
	git tag --verify $*
