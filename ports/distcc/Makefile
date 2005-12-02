# $Id: Makefile,v 1.2 2005/12/02 02:37:03 ruda Exp $

include ../../misc/rules.mk

NAME=		distcc
VERSION=	2.18.3
URL=		http://distcc.samba.org/ftp/distcc/
SOURCE=		$(PACKAGE).tar.bz2
DESCRIPTION=	distcc is a program to distribute builds of C, C++, Objective C or Objective C++ code across several machines on a network.

prep: retrive
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
