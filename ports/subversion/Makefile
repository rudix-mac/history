# $Id: Makefile,v 1.4 2005/12/03 16:16:15 ruda Exp $

include ../../misc/rules.mk

NAME=		subversion
VERSION=	1.2.3
URL=		http://subversion.tigris.org/downloads/
SOURCE=		$(PACKAGE).tar.bz2
DESCRIPTION=	The goal of the Subversion project is to build a version control system that is a compelling replacement for CVS.

prep: retrive
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
