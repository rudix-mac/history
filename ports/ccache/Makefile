# $Id: Makefile,v 1.4 2005/12/02 02:35:37 ruda Exp $

include ../../misc/rules.mk

NAME=		ccache
VERSION=	2.4
URL=		http://ccache.samba.org/ftp/ccache/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	Acts as a caching pre-processor to C or C++ compilers.

prep: retrive
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
