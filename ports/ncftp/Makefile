include ../../misc/rules.mk

NAME=		ncftp
VERSION=	3.1.9
SOURCE=		$(PACKAGE)-src.tar.bz2
URL=		ftp://ftp.ncftp.com/ncftp
DESCRIPTION=	NcFTP is a free set of programs that use the File Transfer Protocol.
MAINTAINER=	Ruda Moura

prep: retrive
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)/usr
	cd $(PACKAGE) ; make prefix=$(CONTENTS)/usr/local install
	$(TOUCH) install

resources:
	mkdir -p $(RESOURCES)
	cp -f $(PACKAGE)/doc/LICENSE.txt $(RESOURCES)/License.txt
	cp -f $(PACKAGE)/README.txt $(RESOURCES)/ReadMe.txt
