include ../../misc/rules.mk

NAME=		ncftp
VERSION=	3.1.9
TITLE=		$(NAME)-$(VERSION)
SOURCE=		$(TITLE)-src.tar.bz2
URL=		ftp://ftp.ncftp.com/ncftp
DESCRIPTION=	NcFTP is a free set of programs that use the File Transfer Protocol.
MAINTAINER=	Ruda Moura

retrive:
	curl -O $(URL)/$(SOURCE)
	$(TOUCH) retrive

prep: retrive
	tar jxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(TITLE) ; ./configure ; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)/usr
	cd $(TITLE) ; make prefix=$(CONTENTS)/usr/local install
	$(TOUCH) install

package: install plist uninstaller
	mkdir -p $(RESOURCES)
	cp -f $(TITLE)/doc/LICENSE.txt $(RESOURCES)/License.txt
	cp -f $(TITLE)/README.txt $(RESOURCES)/ReadMe.txt
	sudo chown -R root:wheel $(CONTENTS)
	$(PACKAGEMAKER) -p $(CWD)/$(TITLE).pkg -f $(CONTENTS) -r $(RESOURCES) -i Info.plist -d Description.plist
	$(TOUCH) package
