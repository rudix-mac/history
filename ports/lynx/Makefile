# $Id: Makefile,v 1.5 2005/12/03 03:59:56 ruda Exp $

include ../../misc/rules.mk

NAME=		lynx
VERSION=	2.8.5
URL=		http://lynx.isc.org/release/
SOURCE=		$(NAME)$(VERSION).tar.bz2
DESCRIPTION=	Lynx is a fully-featured World Wide Web (WWW) text mode client.

prep: retrive
	tar jxvf $(SOURCE)
	mv lynx2-8-5 $(PACKAGE)
	cd $(PACKAGE) ; patch -b < ../lynx.cfg.patch
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure --with-ssl ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
