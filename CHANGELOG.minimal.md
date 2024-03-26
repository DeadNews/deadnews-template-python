## [unreleased]

### Docs

- Update
- Update
- Update

### Fix

- Update dependency uvicorn to ^0.29.0 (#192)

## [2.0.5] - 2024-03-16

### Build

- Update docker tags (#189)

### Chore

- Update dev-dependencies (#190)

### Ci

- Update pre-commit hook astral-sh/ruff-pre-commit to v0.3.3 (#191)

### Docs

- Add (#187)

### Fix

- Update dependency pydantic to v2.6.4 (#188)

## [2.0.4] - 2024-03-09

### Chore

- Update dependency poetry to v1.8.1 (#173)
- Update dev-dependencies (#174)
- Update dev-dependencies (#176)
- Update dependency poetry to v1.8.2 (#181)
- Update dev-dependencies (#184)

### Ci

- Fix `latest tag` behavior in `docker-publish`
- Refactor linting tasks in `Makefile` and `pyproject.toml`
- Update pypa/gh-action-pypi-publish action to v1.8.12 (#172)
- Update pre-commit hooks (#175)
- Update pre-commit hooks (#177)
- Replace `hadolint-docker` with `hadolint-py` (#180)
- Update pre-commit hooks (#182)
- Update pypa/gh-action-pypi-publish action to v1.8.14 (#183)
- Update pre-commit hook pre-commit/mirrors-mypy to v1.9.0 (#185)

### Fix

- Update dependency pydantic to v2.6.2 (#171)
- Update dependency pydantic to v2.6.3 (#178)
- Update dependency fastapi to ^0.110.0 (#179)
- Update dependency uvicorn to ^0.28.0 (#186)

## [2.0.3] - 2024-02-22

### Build

- Add `docker-compose`
- Update `Dockerfile` (#146)
- Update `Dockerfile`
- Update python:3.12.1-alpine docker digest to 14cfc61 (#149)
- Update pypy:3.10-slim docker digest to 41f5d56 (#161)
- Update python docker tag to v3.12.2 (#162)
- Update pypy:3.10-slim docker digest to 27e4f88 (#168)

### Chore

- Update dev-dependencies (#143)
- Update `ruff` settings
- Update `ruff` settings
- Update dev-dependencies (#153)
- Update dependency pytest to v8 (#155)
- Update dev-dependencies (#163)
- Update dev-dependencies (#170)

### Ci

- Add `checkmake` hook
- Update pre-commit hooks (#144)
- Update codecov/codecov-action action to v3.1.6 (#150)
- Update pre-commit hooks (#154)
- Add `python 3.12` to tests matrix (#159)
- Add `pypy3.10` to tests matrix (#160)
- Update pre-commit hooks (#164)
- Update actions/dependency-review-action action to v4 (#165)
- Add `docker-pypy` build configuration (#167)
- Update pre-commit hook astral-sh/ruff-pre-commit to v0.2.2 (#169)

### Fix

- Update dependency fastapi to ^0.109.0 (#145)
- Update dependency uvicorn to ^0.26.0 (#147)
- Update dependency uvicorn to ^0.27.0 (#148)
- Update dependency pydantic to v2.6.0 (#151)
- Update dependency fastapi to v0.109.1 (#152)
- Update dependency fastapi to v0.109.2 (#156)
- Update dependency pydantic to v2.6.1 (#157)
- Update dependency uvicorn to v0.27.1 (#166)

### Style

- Update `ruff` settings
- Update `ruff` settings

## [2.0.2] - 2024-01-07

### Build

- Update python:3.12.0-alpine docker digest to a5d1738 (#117)
- Update python docker tag to v3.12.1 (#129)

### Chore

- Update dev-dependencies (#116)
- Update dev-dependencies (#118)
- Replace `black` with `ruff`
- Replace `black` with `ruff`
- Rename `poe` task
- Rename `poe` task
- Update dev-dependencies (#123)
- Update dependency poetry to v1.7.1 (#125)
- Update dependency poethepoet to ^0.24.4 (#127)
- Update dev-dependencies (#130)
- Update dev-dependencies (#138)
- Update settings (#140)
- Update dependency ruff to ^0.1.11 (#142)
- Update

### Ci

- Update pre-commit hooks (#119)
- Update pre-commit hooks (#124)
- Update pre-commit hooks (#131)
- Update pypa/gh-action-pypi-publish action to v1.8.11 (#132)
- Update github actions (#134)
- Update pre-commit hooks (#137)

### Fix

- Update dependency fastapi to ^0.104.0 (#120)
- Update dependency fastapi to v0.104.1 (#121)
- Update dependency uvicorn to ^0.24.0 (#122)
- Update dependency pydantic to v2.5.1 (#126)
- Update dependency pydantic to v2.5.2 (#128)
- Update dependency fastapi to ^0.105.0 (#133)
- Update dependency pydantic to v2.5.3 (#135)
- Update dependency uvicorn to ^0.25.0 (#136)
- Update dependency fastapi to ^0.108.0 (#139)

## [2.0.1] - 2023-10-16

### Build

- Update python docker tag to v3.12.0 (#114)

### Chore

- Update python docker tag to v3.12 (#115)

### Fix

- Update dependencies
- Update dependency `httptools` to `0.6.1`

## [2.0.0] - 2023-10-03

### Build

- Update `Dockerfile`

## [1.0.4-alpha.1] - 2023-10-03

### Chore

- Update dev-dependencies (#106)
- Update dependency poethepoet to ^0.23.0 (#107)
- Update python docker tag to v3.12.0 (#111)

### Ci

- Update pre-commit hooks (#105)

### Feat

- Change the sample application (#108)

## [1.0.3-alpha.3] - 2023-09-21

### Build

- Add `Dockerfile` (#102)
- Use more explicit tag

### Chore

- Update dependency ruff to ^0.0.267
- Update pre-commit hook charliermarsh/ruff-pre-commit to v0.0.267
- Update dependency mypy to v1.3.0
- Update pre-commit hook pre-commit/mirrors-mypy to v1.3.0
- Rename poetry `group`
- Update dependency charliermarsh/ruff-pre-commit to v0.0.270 (#80)
- Update crate-ci/typos digest to 38a1b19 (#81)
- Update python-jsonschema/check-jsonschema digest to 241789d (#82)
- Update python-poetry/poetry digest to 68b88e5 (#83)
- Update dependency python-jsonschema/check-jsonschema to v0.23.1 (#84)
- Update dependency python-poetry/poetry to v1.5.1 (#85)
- Update dependency ruff to ^0.0.270 (#86)
- Update dependency pytest-cov to v4.1.0 (#87)
- Update dev-dependencies (#89)
- Ignore `PLR0913` ruff rule
- Update `coverage` config
- Update dev-dependencies (#93)
- Update dev-dependencies (#97)
- Specify python `target-version`
- Update dev-dependencies (#100)

### Ci

- Create `settings.yml `
- Adjust schedule
- Add `typos` hook
- Try `.python-version`
- Remove one `codecov` condition
- Cache all dependency groups
- Use shared config
- Update `workflows` (#78)
- Use digest pinning
- Use digest pinning
- Update codecov/codecov-action action to v3.1.4 (#79)
- Use digest pinning
- Use digest pinning
- Try `pinDigests`
- Try `pinDigests`
- Adjust schedule
- Update pre-commit hooks (#90)
- Update pre-commit hooks (#91)
- Update pypa/gh-action-pypi-publish action to v1.8.7 (#92)
- Move `pytest` command
- Disable `codeql` on `pull_request`
- Update pre-commit hooks (#95)
- Update pypa/gh-action-pypi-publish action to v1.8.8 (#96)
- Update schedule
- Disable `codeql` on `schedule`
- Update pre-commit hooks (#98)
- Update pypa/gh-action-pypi-publish action to v1.8.10 (#99)
- Update pre-commit hook python-jsonschema/check-jsonschema to v0.26.1 (#101)
- Use `black` mirror
- Update pre-commit hooks (#103)
- Update actions/checkout action to v4 (#104)
- Add `hadolint` hook

### Docs

- Fix `workflow` name
- Fix `workflow` name
- Update badge

### Revert

- Use `digest pinning`
- Use `digest pinning`
- Try `pinDigests`

## [1.0.2] - 2023-05-06

### Chore

- Update pre-commit hook python-jsonschema/check-jsonschema to v0.23.0
- Update dependency ruff to ^0.0.265
- Update pre-commit hook charliermarsh/ruff-pre-commit to v0.0.265

### Ci

- Unpinn poetry runtime versions
- Update `poetry` hooks

## [1.0.2-alpha.6] - 2023-05-04

### Ci

- Use version specifiers for poetry runtime

## [1.0.2-alpha.5] - 2023-05-04

### Chore

- Downgrade for test
- Downgrade for test

### Ci

- Try `snok/install-poetry`
- Try to install poetry with `pip`
- Try `regexManagers`
- Use version specifiers for poetry runtime
- Use version specifiers for poetry runtime
- Use version specifiers for poetry runtime

### Feat

- Dev pr (#69)

## [1.0.2-alpha.4] - 2023-05-03

### Chore

- Adjust `.gitignore`
- Use all `ruff` rules

### Ci

- Try `trusted publishing`

### Feat

- Replace `isort` and `absolufy-imports` with `ruff`

## [1.0.2-alpha.3] - 2023-05-02

### Chore

- Sort `pyproject.toml`
- Remove `safety`
- Rename project to `deadnews-template-python`
- Disable `ko-poetry-audit-plugin`

## [1.0.2-alpha.2] - 2023-05-02

### Build

- Test `poetry-dynamic-versioning`

## [1.0.2-alpha.1] - 2023-05-02

### Build

- Test `poetry-dynamic-versioning`

## [1.0.2-alpha.0] - 2023-05-02

### Build

- Add `poetry-dynamic-versioning`

### Chore

- Update pre-commit hook pre-commit/mirrors-prettier to v3.0.0-alpha.9-for-vscode

### Feat

- Dev pr (#66)
- Add `ruff` linter
- Replace `flake8` and `bandit` with `ruff`

### Pre-commit

- Reorder hooks
