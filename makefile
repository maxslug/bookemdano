ENV=env
# source requires /bin/bash instead of /bin/sh
SHELL=/bin/bash
CONF=$(HOME)/.isbntools/isbntools.conf

go: setup
	./bookemdano books.txt

# Create shell conf file for in case you want to add isbndb or such
$(CONF) conf:
	mkdir -p $(dir $(CONF))
	isbn_conf make
	mv isbntools.conf $(CONF)

# Bootstrap the virtualenv
setup: $(ENV)
	source $(ENV)/bin/activate; \
	pip install -r requirements.txt;	

# Create the virtualenv
$(ENV):
	virtualenv $(ENV)

# Browse the API of isbntool
src:
	git clone https://github.com/xlcnd/isbntools.git

# This repo
clone:
	git clone https://github.com/maxslug/bookemdano.git
