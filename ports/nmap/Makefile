# $Id: Makefile,v 1.3 2005/11/07 23:44:16 ruda Exp $

include ../../misc/rules.mk

NAME=		nmap
VERSION=	3.93
URL=		http://download.insecure.org/nmap/dist/
SOURCE=		$(PACKAGE).tar.bz2
DESCRIPTION=	Nmap is a free open source utility for network exploration or security auditing.
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

resources:
	mkdir -p $(RESOURCES)
	cp -f $(PACKAGE)/COPYING $(RESOURCES)/License.txt
	cp -f $(PACKAGE)/docs/README $(RESOURCES)/ReadMe.txt
