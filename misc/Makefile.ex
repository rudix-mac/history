#
# Rudix (c) 2005 Ruda Moura
#
# This software is licensed under GPL, see COPYING.txt
#

include ../../lib/rules.mk

# Provide here package information
NAME=		template
VERSION=	1.2.3
URL=		http://shomewhere/to/download/
SOURCE=		$(PACKAGE).tar.gz
#SOURCE=	$(PACKAGE).tar.bz2
#SOURCE=	$(PACKAGE).zip
DESCRIPTION=	A template to use for new ports to Rudix.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

# Prepate software to build (explode archive, apply patches, etc)
prep: retrive
	tar zxvf $(SOURCE)
	#tar jxvf $(SOURCE)
	#unzip $(SOURCE)
	# cd $(PACKAGE) ; patch -b -p1 < .. $(PATCH)
	$(TOUCH) prep

# Now configure and build
build: prep
	cd $(PACKAGE) ; ./configure ; make
	$(TOUCH) build

# Install software in a directory tree
install: build
	mkdir -p $(CONTENTS)
	cd $(PACKAGE) ; make DESTDIR=$(CONTENTS) install
	$(TOUCH) install
