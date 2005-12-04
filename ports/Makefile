# $Id: Makefile,v 1.5 2005/12/04 03:19:04 ruda Exp $

DIRS=	[a-z]*

retrive:
	for i in $(DIRS) ; do ( cd $${i} ; make retrive ) ; done

build:
	for i in $(DIRS) ; do ( cd $${i} ; make build ) ; done

install:
	for i in $(DIRS) ; do ( cd $${i} ; make build ) ; done

pkg:
	for i in $(DIRS) ; do ( cd $${i} ; make pkg ) ; done

dmg:
	for i in $(DIRS) ; do ( cd $${i} ; make dmg ) ; done

clean:
	for i in $(DIRS) ; do ( cd $${i} ; make clean ) ; done

distclean:
	for i in $(DIRS) ; do ( cd $${i} ; make distclean ) ; done

realdistclean:
	for i in $(DIRS) ; do ( cd $${i} ; make pkgclean ) ; done
