all: build

build:
	@rm -rf dist
	@poetry build

format:
	@poetry run ruff check --fix
	@poetry run ruff format

lint:
	@poetry run ruff check
	@poetry run ruff format --check
	@poetry run rstcheck README.rst

test:
	@poetry run pytest --cov=./makenew_pypackage

watch:
	@poetry run ptw

version:
	@git add pyproject.toml
	@git commit -m "$$(poetry version -s)"
	@git tag --sign "v$$(poetry version -s)" -m "$(poetry version -s)"
	@git push --follow-tags

.PHONY: build format lint test watch version
