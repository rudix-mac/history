# $Id: Makefile,v 1.1 2005/11/07 01:24:26 ruda Exp $

include ../../misc/rules.mk

NAME=		sqlite
VERSION=	3.2.7
URL=		http://www.sqlite.org/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	SQLite is a small C library that implements a self-contained, embeddable, zero-configuration SQL database engine.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

prep: retrive
	tar zxvf $(SOURCE)
	cp copyright-release.html $(PACKAGE)/COPYING
	$(TOUCH) prep

build: prep /Library/Receipts/readline-5.0.pkg
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)
	cd $(PACKAGE) ; make DESTDIR=$(CONTENTS) install
	$(TOUCH) install
