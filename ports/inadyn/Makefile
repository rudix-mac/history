include ../../misc/rules.mk

NAME=		inadyn
VERSION=	1.96
TITLE=		$(NAME)-$(VERSION)
URL=		http://inadyn.ina-tech.net/
SOURCE=		$(NAME).v$(VERSION).zip
DESCRIPTION=	Simple DYNAMIC DNS client.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

retrive:
	curl -O $(URL)/$(SOURCE)
	$(TOUCH) retrive

prep: retrive
	unzip $(SOURCE)
	mv $(NAME) $(TITLE)
	$(TOUCH) prep

build: prep
	cd $(TITLE) ; make TARGET_ARCH=macosx
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)/usr/local/sbin
	mkdir -p $(CONTENTS)/usr/local/man/man{5,8}
	cd $(TITLE) ; cp -pf bin/macosx/inadyn $(CONTENTS)/usr/local/sbin ; cp -pf man/inadyn.8 $(CONTENTS)/usr/local/man/man8 ; cp -pf man/inadyn.conf.5 $(CONTENTS)/usr/local/man/man5
	$(TOUCH) install

package: install plist uninstaller
	mkdir -p $(RESOURCES)
	cp -f COPYING $(RESOURCES)/License.txt
	cp -f $(TITLE)/readme.html $(RESOURCES)/ReadMe.html
	sudo chown -R root:wheel $(CONTENTS)
	$(PACKAGEMAKER) -p $(CWD)/$(TITLE).pkg -f $(CONTENTS) -r $(RESOURCES) -i Info.plist -d Description.plist
	$(TOUCH) package
