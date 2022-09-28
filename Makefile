all: lint test build

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

.PHONY: build docs test
