# Changelog

All notable changes to this project will be documented in this file.

## [unreleased]

### 🐛 Bug Fixes

- *(deps)* Update dependency uvicorn to ^0.29.0 (#192)

### 📚 Documentation

- *(readme)* Update
- *(readme)* Update
- *(readme)* Update

## [2.0.5] - 2024-03-16

### 🐛 Bug Fixes

- *(deps)* Update dependency pydantic to v2.6.4 (#188)

### 📚 Documentation

- *(mkdocs)* Add (#187)

### ⚙️ Miscellaneous Tasks

- *(deps)* Update pre-commit hook astral-sh/ruff-pre-commit to v0.3.3 (#191)

### Build

- *(deps)* Update docker tags (#189)

## [2.0.4] - 2024-03-09

### 🐛 Bug Fixes

- *(deps)* Update dependency pydantic to v2.6.2 (#171)
- *(deps)* Update dependency pydantic to v2.6.3 (#178)
- *(deps)* Update dependency fastapi to ^0.110.0 (#179)
- *(deps)* Update dependency uvicorn to ^0.28.0 (#186)

### ⚙️ Miscellaneous Tasks

- Fix `latest tag` behavior in `docker-publish`
- Refactor linting tasks in `Makefile` and `pyproject.toml`
- *(deps)* Update pypa/gh-action-pypi-publish action to v1.8.12 (#172)
- *(deps)* Update pre-commit hooks (#175)
- *(deps)* Update pre-commit hooks (#177)
- *(pre-commit)* Replace `hadolint-docker` with `hadolint-py` (#180)
- *(deps)* Update pre-commit hooks (#182)
- *(deps)* Update pypa/gh-action-pypi-publish action to v1.8.14 (#183)
- *(deps)* Update pre-commit hook pre-commit/mirrors-mypy to v1.9.0 (#185)

## [2.0.3] - 2024-02-22

### 🐛 Bug Fixes

- *(deps)* Update dependency fastapi to ^0.109.0 (#145)
- *(deps)* Update dependency uvicorn to ^0.26.0 (#147)
- *(deps)* Update dependency uvicorn to ^0.27.0 (#148)
- *(deps)* Update dependency pydantic to v2.6.0 (#151)
- *(deps)* Update dependency fastapi to v0.109.1 (#152)
- *(deps)* Update dependency fastapi to v0.109.2 (#156)
- *(deps)* Update dependency pydantic to v2.6.1 (#157)
- *(deps)* Update dependency uvicorn to v0.27.1 (#166)

### 🎨 Styling

- Update `ruff` settings
- Update `ruff` settings

### ⚙️ Miscellaneous Tasks

- *(pre-commit)* Add `checkmake` hook
- *(deps)* Update pre-commit hooks (#144)
- Update `ruff` settings
- Update `ruff` settings
- *(deps)* Update codecov/codecov-action action to v3.1.6 (#150)
- *(deps)* Update pre-commit hooks (#154)
- *(github)* Add `python 3.12` to tests matrix (#159)
- Add `pypy3.10` to tests matrix (#160)
- *(deps)* Update pre-commit hooks (#164)
- *(deps)* Update actions/dependency-review-action action to v4 (#165)
- Add `docker-pypy` build configuration (#167)
- *(deps)* Update pre-commit hook astral-sh/ruff-pre-commit to v0.2.2 (#169)

### Build

- *(docker)* Add `docker-compose`
- *(docker)* Update `Dockerfile` (#146)
- *(docker)* Update `Dockerfile`
- *(deps)* Update python:3.12.1-alpine docker digest to 14cfc61 (#149)
- *(deps)* Update pypy:3.10-slim docker digest to 41f5d56 (#161)
- *(deps)* Update python docker tag to v3.12.2 (#162)
- *(deps)* Update pypy:3.10-slim docker digest to 27e4f88 (#168)

## [2.0.2] - 2024-01-07

### 🐛 Bug Fixes

- *(deps)* Update dependency fastapi to ^0.104.0 (#120)
- *(deps)* Update dependency fastapi to v0.104.1 (#121)
- *(deps)* Update dependency uvicorn to ^0.24.0 (#122)
- *(deps)* Update dependency pydantic to v2.5.1 (#126)
- *(deps)* Update dependency pydantic to v2.5.2 (#128)
- *(deps)* Update dependency fastapi to ^0.105.0 (#133)
- *(deps)* Update dependency pydantic to v2.5.3 (#135)
- *(deps)* Update dependency uvicorn to ^0.25.0 (#136)
- *(deps)* Update dependency fastapi to ^0.108.0 (#139)

### ⚙️ Miscellaneous Tasks

- *(deps)* Update pre-commit hooks (#119)
- Replace `black` with `ruff`
- Replace `black` with `ruff`
- Rename `poe` task
- Rename `poe` task
- *(deps)* Update pre-commit hooks (#124)
- *(deps)* Update pre-commit hooks (#131)
- *(deps)* Update pypa/gh-action-pypi-publish action to v1.8.11 (#132)
- *(deps)* Update github actions (#134)
- *(deps)* Update pre-commit hooks (#137)
- *(vscode)* Update settings (#140)
- *(makefile)* Update

### Build

- *(deps)* Update python:3.12.0-alpine docker digest to a5d1738 (#117)
- *(deps)* Update python docker tag to v3.12.1 (#129)

## [2.0.1] - 2023-10-16

### 🐛 Bug Fixes

- *(deps)* Update dependencies
- *(deps)* Update dependency `httptools` to `0.6.1`

### Build

- *(deps)* Update python docker tag to v3.12.0 (#114)

## [2.0.0] - 2023-10-03

### Build

- *(docker)* Update `Dockerfile`

## [1.0.4-alpha.1] - 2023-10-03

### 🚀 Features

- Change the sample application (#108)

### ⚙️ Miscellaneous Tasks

- *(deps)* Update pre-commit hooks (#105)

## [1.0.3-alpha.3] - 2023-09-21

### 📚 Documentation

- Fix `workflow` name
- Fix `workflow` name
- *(readme)* Update badge

### ⚙️ Miscellaneous Tasks

- Create `settings.yml `
- *(pre-commit)* Adjust schedule
- *(pre-commit)* Add `typos` hook
- Try `.python-version`
- Remove one `codecov` condition
- Cache all dependency groups
- *(renovate)* Use shared config
- Update `workflows` (#78)
- Rename poetry `group`
- Use digest pinning
- Use digest pinning
- *(deps)* Update codecov/codecov-action action to v3.1.4 (#79)
- Use digest pinning
- Use digest pinning
- Try `pinDigests`
- Try `pinDigests`
- *(renovate)* Adjust schedule
- *(deps)* Update pre-commit hooks (#90)
- Ignore `PLR0913` ruff rule
- Update `coverage` config
- *(deps)* Update pre-commit hooks (#91)
- *(deps)* Update pypa/gh-action-pypi-publish action to v1.8.7 (#92)
- Move `pytest` command
- Disable `codeql` on `pull_request`
- *(deps)* Update pre-commit hooks (#95)
- *(deps)* Update pypa/gh-action-pypi-publish action to v1.8.8 (#96)
- *(renovate)* Update schedule
- Disable `codeql` on `schedule`
- Specify python `target-version`
- *(deps)* Update pre-commit hooks (#98)
- *(deps)* Update pypa/gh-action-pypi-publish action to v1.8.10 (#99)
- *(deps)* Update pre-commit hook python-jsonschema/check-jsonschema to v0.26.1 (#101)
- *(pre-commit)* Use `black` mirror
- *(deps)* Update pre-commit hooks (#103)
- *(deps)* Update actions/checkout action to v4 (#104)
- *(pre-commit)* Add `hadolint` hook

### ◀️ Revert

- *(pre-commit)* Use `digest pinning`
- *(pre-commit)* Use `digest pinning`
- Try `pinDigests`

### Build

- *(docker)* Add `Dockerfile` (#102)
- *(docker)* Use more explicit tag

## [1.0.2] - 2023-05-06

### ⚙️ Miscellaneous Tasks

- Unpinn poetry runtime versions
- *(pre-commit)* Update `poetry` hooks

## [1.0.2-alpha.6] - 2023-05-04

### ⚙️ Miscellaneous Tasks

- Use version specifiers for poetry runtime

## [1.0.2-alpha.5] - 2023-05-04

### 🚀 Features

- Dev pr (#69)

### ⚙️ Miscellaneous Tasks

- Try `snok/install-poetry`
- Try to install poetry with `pip`
- *(renovate)* Try `regexManagers`
- Use version specifiers for poetry runtime
- Use version specifiers for poetry runtime
- Use version specifiers for poetry runtime

## [1.0.2-alpha.4] - 2023-05-03

### 🚀 Features

- Replace `isort` and `absolufy-imports` with `ruff`

### ⚙️ Miscellaneous Tasks

- Adjust `.gitignore`
- Use all `ruff` rules
- Try `trusted publishing`

## [1.0.2-alpha.3] - 2023-05-02

### ⚙️ Miscellaneous Tasks

- Sort `pyproject.toml`
- Rename project to `deadnews-template-python`
- *(pre-commit)* Disable `ko-poetry-audit-plugin`

## [1.0.2-alpha.2] - 2023-05-02

### Build

- Test `poetry-dynamic-versioning`

## [1.0.2-alpha.1] - 2023-05-02

### Build

- Test `poetry-dynamic-versioning`

## [1.0.2-alpha.0] - 2023-05-02

### 🚀 Features

- Dev pr (#66)
- *(ruff)* Add `ruff` linter
- Replace `flake8` and `bandit` with `ruff`

### Build

- Add `poetry-dynamic-versioning`

### Pre-commit

- Reorder hooks

<!-- generated by git-cliff -->
