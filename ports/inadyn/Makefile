# $Id: Makefile,v 1.3 2005/11/07 23:44:16 ruda Exp $

include ../../misc/rules.mk

NAME=		inadyn
VERSION=	1.96
URL=		http://inadyn.ina-tech.net/
SOURCE=		$(NAME).v$(VERSION).zip
DESCRIPTION=	Simple DYNAMIC DNS client.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

prep: retrive
	unzip $(SOURCE)
	mv $(NAME) $(PACKAGE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; make TARGET_ARCH=macosx
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)/usr/local/sbin
	mkdir -p $(CONTENTS)/usr/local/man/man{5,8}
	cd $(PACKAGE) ; cp -pf bin/macosx/inadyn $(CONTENTS)/usr/local/sbin ; cp -pf man/inadyn.8 $(CONTENTS)/usr/local/man/man8 ; cp -pf man/inadyn.conf.5 $(CONTENTS)/usr/local/man/man5
	$(TOUCH) install

resources:
	mkdir -p $(RESOURCES)
	cp -f COPYING $(RESOURCES)/License.txt
	cp -f $(PACKAGE)/readme.html $(RESOURCES)/ReadMe.html
