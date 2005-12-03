# $Id: Makefile,v 1.4 2005/12/03 01:34:33 ruda Exp $

include ../../misc/rules.mk

NAME=		inadyn
VERSION=	1.96
URL=		http://inadyn.ina-tech.net/
SOURCE=		$(NAME).v$(VERSION).zip
DESCRIPTION=	Simple DYNAMIC DNS client.

README=		$(PACKAGE)/readme.html
LICENSE=	COPYING

prep: retrive
	unzip $(SOURCE)
	mv $(NAME) $(PACKAGE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; make TARGET_ARCH=macosx
	$(TOUCH) build

install: build
	mkdir -p $(INSTALLDIR)/usr/local/sbin
	mkdir -p $(INSTALLDIR)/usr/local/man/man{5,8}
	install -m 755 $(PACKAGE)/bin/macosx/inadyn $(INSTALLDIR)/usr/local/sbin
	install -m 644 $(PACKAGE)/man/inadyn.8 $(INSTALLDIR)/usr/local/man/man8
	install -m 644 $(PACKAGE)/man/inadyn.conf.5 $(INSTALLDIR)/usr/local/man/man5
	$(TOUCH) install

