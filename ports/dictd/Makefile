# $Id: Makefile,v 1.2 2005/11/07 23:44:16 ruda Exp $

include ../../misc/rules.mk

NAME=		dictd
VERSION=	1.9.15
URL=		ftp://ftp.dict.org/pub/dict/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	Dict is a client for the Dictionary Server Protocol (DICT).
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
