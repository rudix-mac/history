include ../../misc/rules.mk

NAME=		nmap
VERSION=	3.93
TITLE=		$(NAME)-$(VERSION)
URL=		http://download.insecure.org/nmap/dist/
SOURCE=		$(TITLE).tar.bz2
DESCRIPTION=	Nmap is a free open source utility for network exploration or security auditing.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

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
	mkdir -p $(CONTENTS)
	cd $(TITLE) ; make DESTDIR=$(CONTENTS) install
	$(TOUCH) install

package: install plist uninstaller
	mkdir -p $(RESOURCES)
	cp -f $(TITLE)/COPYING $(RESOURCES)/License.txt
	cp -f $(TITLE)/docs/README $(RESOURCES)/ReadMe.txt
	sudo chown -R root:wheel $(CONTENTS)
	$(PACKAGEMAKER) -p $(CWD)/$(TITLE).pkg -f $(CONTENTS) -r $(RESOURCES) -i Info.plist -d Description.plist
	$(TOUCH) package
