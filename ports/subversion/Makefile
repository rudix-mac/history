# $Id: Makefile,v 1.3 2005/11/07 23:44:16 ruda Exp $

include ../../misc/rules.mk

NAME=		subversion
VERSION=	1.2.3
URL=		http://subversion.tigris.org/downloads/
SOURCE=		$(PACKAGE).tar.bz2
DESCRIPTION=	The goal of the Subversion project is to build a version control system that is a compelling replacement for CVS.
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
