# $Id: Makefile,v 1.3 2005/12/02 02:36:12 ruda Exp $

include ../../misc/rules.mk

NAME=		dictd
VERSION=	1.9.15
URL=		ftp://ftp.dict.org/pub/dict/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	Dict is a client for the Dictionary Server Protocol (DICT).

prep: retrive
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
