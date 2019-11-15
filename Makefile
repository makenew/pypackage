all: lint test

build:
	@rm -rf dist
	@poetry build

clean:
	@rm -rf .pytest-incremental

lint:
	@poetry run pylint ./makenew_pypackage

publish:
	@poetry run twine upload dist/*

test:
	@poetry run pytest --inc --cov=./makenew_pypackage

watch:
	@poetry run ptw

.PHONY: build docs test
