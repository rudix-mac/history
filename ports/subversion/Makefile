include ../../misc/rules.mk

NAME=		subversion
VERSION=	1.2.3
TITLE=		$(NAME)-$(VERSION)
URL=		http://subversion.tigris.org/downloads/
SOURCE=		$(TITLE).tar.bz2
DESCRIPTION=	The goal of the Subversion project is to build a version control system that is a compelling replacement for CVS.
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
	cp -f $(TITLE)/README $(RESOURCES)/ReadMe.txt
	sudo chown -R root:wheel $(CONTENTS)
	$(PACKAGEMAKER) -p $(CWD)/$(TITLE).pkg -f $(CONTENTS) -r $(RESOURCES) -i Info.plist -d Description.plist
	$(TOUCH) package
