include ../../misc/rules.mk

NAME=		readline
VERSION=	5.0
URL=		ftp://ftp.gnu.org/gnu/readline/
SOURCE=		$(PACKAGE).tar.gz
DESCRIPTION=	Readline provides a set of functions for use by applications that allow users to edit command lines as they are typed in.
MAINTAINER=	Ruda Moura <ruda.moura@gmail.com>

prep: retrive
	tar zxvf $(SOURCE)
	$(TOUCH) prep

build: prep
	cd $(PACKAGE) ; ./configure --enable-shared; make
	$(TOUCH) build

install: build
	mkdir -p $(CONTENTS)
	cd $(PACKAGE) ; make DESTDIR=$(CONTENTS) install
	$(TOUCH) install
