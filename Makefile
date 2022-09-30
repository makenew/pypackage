all: build

build:
	@rm -rf dist
	@poetry build

format:
	@poetry run black .

lint:
	@poetry run pylint ./makenew_pypackage
	@poetry run black --check .

test:
	@poetry run pytest --cov=./makenew_pypackage

watch:
	@poetry run ptw

version:
	@git add pyproject.toml
	@git commit -m "$(poetry version)"
	@git tag --sign "v$(poetry version)" -m "$(poetry version)"
	@git push --follow-tags
