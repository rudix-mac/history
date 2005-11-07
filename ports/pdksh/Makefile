# $Id: Makefile,v 1.2 2005/11/07 23:44:16 ruda Exp $

include ../../misc/rules.mk

NAME=		pdksh
VERSION=	5.2.14
URL=		ftp://ftp.cs.mun.ca/pub/pdksh/
SOURCE=		$(PACKAGE).tar.gz
PATCH1=		$(PACKAGE)-patches.1
PATCH2=		$(PACKAGE)-patches.2
DESCRIPTION=	PD-ksh is a clone of the AT&T Korn shell
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>
WGET=		curl -O --disable-epsv

retrive:
	$(WGET) $(URL)/$(SOURCE)
	$(WGET) $(URL)/$(PATCH1)
	$(WGET) $(URL)/$(PATCH2)
	$(TOUCH) retrive

prep: retrive
	tar zxvf $(SOURCE)
	cd $(PACKAGE) ; patch -b < ../$(PATCH1) ; patch -b < ../$(PATCH2)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)
	cd $(PACKAGE) ; make prefix=$(CONTENTS)/usr/local install
	$(TOUCH) install

resources:
	mkdir -p $(RESOURCES)
	cp -f $(PACKAGE)/LEGAL $(RESOURCES)/License.txt
	cp -f $(PACKAGE)/README $(RESOURCES)/ReadMe.txt

retriveclean:
	rm -f retrive $(SOURCE) $(PATCH1) $(PATCH2)
