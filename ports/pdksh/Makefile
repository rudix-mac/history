# $Id: Makefile,v 1.3 2005/12/03 23:08:44 ruda Exp $

include ../../misc/rules.mk

NAME=		pdksh
VERSION=	5.2.14
URL=		ftp://ftp.cs.mun.ca/pub/pdksh/
SOURCE=		$(PACKAGE).tar.gz
PATCH1=		$(PACKAGE)-patches.1
PATCH2=		$(PACKAGE)-patches.2
DESCRIPTION=	PD-ksh is a clone of the AT&T Korn shell
WGET=		curl -O --disable-epsv
LICENSE=	$(PACKAGE)/LEGAL
README=		$(PACKAGE)/README

retrive:
	$(WGET) $(URL)/$(SOURCE)
	$(WGET) $(URL)/$(PATCH1)
	$(WGET) $(URL)/$(PATCH2)
	$(TOUCH) retrive

prep: retrive
	tar zxvf $(SOURCE)
	cd $(PACKAGE) ; patch -b < ../$(PATCH1) ; patch -b < ../$(PATCH2)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make prefix=$(INSTALLDIR)/usr/local install
	$(TOUCH) install

retriveclean:
	rm -f retrive $(SOURCE) $(PATCH1) $(PATCH2)
