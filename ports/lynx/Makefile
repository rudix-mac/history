include ../../misc/rules.mk

NAME=		lynx
VERSION=	2.8.5
TITLE=		$(NAME)-$(VERSION)
URL=		http://lynx.isc.org/release/
SOURCE=		$(NAME)$(VERSION).tar.bz2
DESCRIPTION=	Lynx is a fully-featured World Wide Web (WWW) text mode client.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

retrive:
	curl -O $(URL)/$(SOURCE)
	$(TOUCH) retrive

prep: retrive
	tar jxvf $(SOURCE)
	mv lynx2-8-5 $(TITLE)
	$(TOUCH) prep

build: prep
	cd $(TITLE) ; ./configure ; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)
	cd $(TITLE) ; make DESTDIR=$(CONTENTS) install
	$(TOUCH) install

package: install plist uninstaller
	mkdir -p $(RESOURCES)
	cp -f $(TITLE)/COPYING $(RESOURCES)/License.txt
	cp -f $(TITLE)/README $(RESOURCES)/ReadMe.txt
	sudo chown -R root:wheel $(CONTENTS)
	$(PACKAGEMAKER) -p $(CWD)/$(TITLE).pkg -f $(CONTENTS) -r $(RESOURCES) -i Info.plist -d Description.plist
	$(TOUCH) package
