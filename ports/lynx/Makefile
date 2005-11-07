# $Id: Makefile,v 1.4 2005/11/07 23:44:16 ruda Exp $

include ../../misc/rules.mk

NAME=		lynx
VERSION=	2.8.5
URL=		http://lynx.isc.org/release/
SOURCE=		$(NAME)$(VERSION).tar.bz2
DESCRIPTION=	Lynx is a fully-featured World Wide Web (WWW) text mode client.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

prep: retrive
	tar jxvf $(SOURCE)
	mv lynx2-8-5 $(PACKAGE)
	cd $(PACKAGE) ; patch -b < ../lynx.cfg.patch
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure --with-ssl ; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)
	cd $(PACKAGE) ; make DESTDIR=$(CONTENTS) install
	$(TOUCH) install
