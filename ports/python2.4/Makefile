include ../../misc/rules.mk

NAME=		python
VERSION=	2.4.2
URL=		http://python.org/ftp/python/2.4.2/
SOURCE=		Python-$(VERSION).tar.bz2
DESCRIPTION=	Acts as a caching pre-processor to C or C++ compilers.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

prep: retrive
	tar jxvf $(SOURCE)
	mv Python-$(VERSION) $(PACKAGE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)
	cd $(PACKAGE) ; make DESTDIR=$(CONTENTS) install
	cd $(CONTENTS)/usr/local/bin ; rm python idle smtpd.py pydoc
	cd $(CONTENTS)/usr/local/man/man1 ; mv python.1 python2.4.1
	$(TOUCH) install

resources:
	mkdir -p $(RESOURCES)
	cp -f $(PACKAGE)/LICENSE $(RESOURCES)/License.txt
	cp -f $(PACKAGE)/README $(RESOURCES)/ReadMe.txt
