venv:
ifndef VIRTUAL_ENV
	$(error Please install and activate a virtualenv before using the init or dev targets)
endif

init: venv
	pip install distribute
	pip install nose
	pip install docutils
	pip install -r requirements.txt

dev: init
	pip install --upgrade -e .

test:
	nosetests tests

upload: check
	python setup.py sdist upload

clean:
	python setup.py clean

distclean: clean dist

dist: check
	python setup.py sdist

check:
	python setup.py check