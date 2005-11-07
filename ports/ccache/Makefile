# $Id: Makefile,v 1.3 2005/11/07 23:44:16 ruda Exp $

include ../../misc/rules.mk

NAME=		ccache
VERSION=	2.4
URL=		http://ccache.samba.org/ftp/ccache/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	Acts as a caching pre-processor to C or C++ compilers.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

prep: retrive
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)
	cd $(PACKAGE) ; make DESTDIR=$(CONTENTS) install
	$(TOUCH) install
