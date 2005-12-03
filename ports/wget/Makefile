# $Id: Makefile,v 1.4 2005/12/03 01:18:36 ruda Exp $

include ../../misc/rules.mk

NAME=		wget
VERSION=	1.10.2
URL=		ftp://ftp.gnu.org/gnu/wget/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	GNU Wget is a free utility for non-interactive download of files from the Web.

prep: retrive
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
