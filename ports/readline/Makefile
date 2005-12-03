# $Id: Makefile,v 1.3 2005/12/03 03:23:51 ruda Exp $

include ../../misc/rules.mk

NAME=		readline
VERSION=	5.0
URL=		ftp://ftp.gnu.org/gnu/readline/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	Readline provides a set of functions for use by applications that allow users to edit command lines as they are typed in.

prep: retrive
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure --enable-shared; make
	$(TOUCH) build

install: build
	cd $(PACKAGE) ; make DESTDIR=$(INSTALLDIR) install
	$(TOUCH) install
