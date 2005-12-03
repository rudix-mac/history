# $Id: Makefile,v 1.2 2005/12/03 03:59:19 ruda Exp $

include ../../misc/rules.mk

NAME=		sqlite
VERSION=	3.2.7
URL=		http://www.sqlite.org/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	SQLite is a small C library that implements a self-contained, embeddable, zero-configuration SQL database engine.
LICENSE=	copyright-release.html
README=		$(PACKAGE)/README

prep: retrive
	tar zxvf $(SOURCE)
	cp copyright-release.html $(PACKAGE)/COPYING
	$(TOUCH) prep

build: prep /Library/Receipts/readline-5.0.pkg
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
