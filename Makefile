.PHONY: all clean default install lock update checks pc test docs run

default: checks

install:
	uv sync

lock:
	uv lock

update:
	uv lock --upgrade
	uv sync

run:
	uv run uvicorn --reload deadnews_template_python:app

checks: pc install lint test
pc:
	pre-commit run -a
lint:
	uv run ruff check .
	uv run ruff format .
	uv run mypy .
	uv run pyright .
test:
	uv run pytest --cov-report=xml

doc:
	uv run mkdocs serve

bumped:
	git cliff --bumped-version

# make release TAG=$(git cliff --bumped-version)-alpha.0
release: checks
	git cliff -o CHANGELOG.md --tag $(TAG)
	pre-commit run --files CHANGELOG.md || pre-commit run --files CHANGELOG.md
	git add CHANGELOG.md
	git commit -m "chore(release): prepare for $(TAG)"
	git push
	git tag -a $(TAG) -m "chore(release): $(TAG)"
	git push origin $(TAG)
