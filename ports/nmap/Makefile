# $Id: Makefile,v 1.4 2005/12/03 03:12:55 ruda Exp $

include ../../misc/rules.mk

NAME=		nmap
VERSION=	3.93
URL=		http://download.insecure.org/nmap/dist/
SOURCE=		$(PACKAGE).tar.bz2
DESCRIPTION=	Nmap is a free open source utility for network exploration or security auditing.
LICENSE=	$(PACKAGE)/COPYING
README=		$(PACKAGE)/docs/README

prep: retrive
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
