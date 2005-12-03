# $Id: Makefile,v 1.4 2005/12/03 02:31:32 ruda Exp $

include ../../misc/rules.mk

NAME=		ncftp
VERSION=	3.1.9
SOURCE=		$(PACKAGE)-src.tar.bz2
URL=		ftp://ftp.ncftp.com/ncftp
DESCRIPTION=	NcFTP is a free set of programs that use the File Transfer Protocol.
LICENSE=	$(PACKAGE)/doc/LICENSE.txt
README=		$(PACKAGE)/README.txt

prep: retrive
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	mkdir -p $(INSTALLDIR)/usr
	cd $(PACKAGE) ; make prefix=$(INSTALLDIR)/usr/local install
	$(TOUCH) install
