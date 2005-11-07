# $Id: Makefile,v 1.3 2005/11/07 23:44:16 ruda Exp $

include ../../misc/rules.mk

NAME=		gnupg
VERSION=	1.4.2
URL=		ftp://ftp.gnupg.org/gcrypt/gnupg/
SOURCE=		$(PACKAGE).tar.bz2
DESCRIPTION=	GnuPG is a complete and free replacement for PGP.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

prep: retrive
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)
	cd $(PACKAGE) ; make DESTDIR=$(CONTENTS) install
	$(TOUCH) install
