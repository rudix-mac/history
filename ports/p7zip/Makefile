include ../../misc/rules.mk

NAME=		p7zip
VERSION=	4.20
TITLE=		$(NAME)-$(VERSION)
URL=		http://ufpr.dl.sourceforge.net/sourceforge/p7zip/
SOURCE=		$(NAME)_$(VERSION)_src.tar.bz2
DESCRIPTION=	p7zip is a quick port of 7z.exe and 7za.exe for Unix. 7-Zip is a file archiver with highest compression ratio.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

retrive:
	curl -O $(URL)/$(SOURCE)
	$(TOUCH) retrive

prep: retrive
	tar jxvf $(SOURCE)
	mv $(NAME)_$(VERSION) $(TITLE)
	cd $(TITLE) ; patch < ../rudix.patch
	$(TOUCH) prep

build: prep
	cd $(TITLE) ; cp -f makefile.macosx makefile.machine ; make all2
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)
	cd $(TITLE) ; make DEST_BIN=$(CONTENTS)/usr/local/bin \
			DEST_SHARE=$(CONTENTS)/usr/local/lib/p7zip \
			DEST_MAN=$(CONTENTS)/usr/local/man \
			install
	$(TOUCH) install

package: install plist uninstaller
	mkdir -p $(RESOURCES)
	cp -f $(TITLE)/DOCS/copying.txt $(RESOURCES)/License.txt
	cp -f $(TITLE)/README $(RESOURCES)/ReadMe.txt
	sudo chown -R root:wheel $(CONTENTS)
	$(PACKAGEMAKER) -p $(CWD)/$(TITLE).pkg -f $(CONTENTS) -r $(RESOURCES) -i Info.plist -d Description.plist
	$(TOUCH) package
