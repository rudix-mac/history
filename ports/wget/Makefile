# $Id: Makefile,v 1.3 2005/11/07 23:44:16 ruda Exp $

include ../../misc/rules.mk

NAME=		wget
VERSION=	1.10.1
URL=		ftp://ftp.gnu.org/gnu/wget/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	GNU Wget is a free utility for non-interactive download of files from the Web.
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
