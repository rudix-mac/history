# $Id: Makefile,v 1.4 2005/11/07 01:25:37 ruda Exp $

DIRS=	[a-z]*

retrive:
	for i in $(DIRS) ; do ( cd $${i} ; make retrive ) ; done

build:
	for i in $(DIRS) ; do ( cd $${i} ; make build ) ; done

dmg:
	for i in $(DIRS) ; do ( cd $${i} ; make dmg ) ; done

clean:
	for i in $(DIRS) ; do ( cd $${i} ; make clean ) ; done

distclean:
	for i in $(DIRS) ; do ( cd $${i} ; make distclean ) ; done
