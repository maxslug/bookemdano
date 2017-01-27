# https://github.com/xlcnd/isbntools
# https://pypi.python.org/pypi/isbnlib
# http://isbndb.com/api/v2/docs
# http://isbndb.com/account/logincreate

ENV=env
SHELL=/bin/bash
CONF=$(HOME)/.isbntools/isbntools.conf

go:
	./bookemdano books.txt

$(CONF) conf:
	mkdir -p $(dir $(CONF))
	isbn_conf make
	mv isbntools.conf $(CONF)

setup: $(ENV)
	source $(ENV)/bin/activate; \
	pip install -r requirements.txt;	

$(ENV):
	virtualenv $(ENV)

src:
	git clone https://github.com/xlcnd/isbntools.git

clone:
	git clone https://github.com/maxslug/bookemdano.git
