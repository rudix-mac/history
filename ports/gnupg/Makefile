# $Id: Makefile,v 1.4 2005/12/03 01:20:20 ruda Exp $

include ../../misc/rules.mk

NAME=		gnupg
VERSION=	1.4.2
URL=		ftp://ftp.gnupg.org/gcrypt/gnupg/
SOURCE=		$(PACKAGE).tar.bz2
DESCRIPTION=	GnuPG is a complete and free replacement for PGP.

prep: retrive
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
