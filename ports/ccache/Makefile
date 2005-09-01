include ../../misc/rules.mk

NAME=		ccache
VERSION=	2.4
TITLE=		$(NAME)-$(VERSION)
URL=		http://ccache.samba.org/ftp/ccache/
SOURCE=		$(TITLE).tar.gz
DESCRIPTION=	Acts as a caching pre-processor to C or C++ compilers.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

retrive:
	curl -O $(URL)/$(SOURCE)
	$(TOUCH) retrive

prep: retrive
	tar zxvf $(SOURCE)
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
