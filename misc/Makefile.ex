#
# Rudix (c) 2005 Ruda Moura
#
# This software is licensed under GPL, see COPYING.txt
#

include ../../lib/rules.mk

# Provide here package information
NAME=		template
VERSION=	1.2.3
TITLE=		$(NAME)-$(VERSION)
URL=		http://shomewhere/to/download/
SOURCE=		$(TITLE).tar.gz
#SOURCE=	$(TITLE).tar.bz2
#SOURCE=	$(TITLE).zip
#PATCH=		$(TITLE)-make_this_package_more_cool.patch
#URL=		ftp://shomewhere/pub/download
DESCRIPTION=	A template to use for new ports to Rudix.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

# How to download software
retrive:
	curl -O $(URL)/$(SOURCE)
	$(TOUCH) retrive

# Prepate software to build (explode archive, apply patches, etc)
prep: retrive
	tar zxvf $(SOURCE)
	#tar jxvf $(SOURCE)
	#unzip $(SOURCE)
	# cd $(TITLE) ; patch -b -p1 < .. $(PATCH)
	$(TOUCH) prep

# Now configure and build
build: prep
	cd $(TITLE) ; ./configure ; make
	$(TOUCH) build

# Install software in a directory tree
install: build
	mkdir -p $(CONTENTS)
	cd $(TITLE) ; make DESTDIR=$(CONTENTS) install
	$(TOUCH) install

# Create the package
pacakge: install plist uninstaller
	mkdir -p $(RESOURCES)
	cp -f $(TITLE)/COPYING $(RESOURCES)/License.txt
	cp -f $(TITLE)/README $(RESOURCES)/ReadMe.txt
	sudo chown -R root:wheel $(CONTENTS)
	$(PACKAGEMAKER) -build -p $(CWD)/$(TITLE).pkg -f $(CONTENTS) -r $(RESOURCES) -i Info.plist -d Description.plist
	$(TOUCH) pacakge
