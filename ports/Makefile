# $Id: Makefile,v 1.3 2005/11/07 01:24:26 ruda Exp $

DIRS=	[a-z]*

retrive:
	for i in $(DIRS) ; do ( cd $${i} ; make retrive ) ; done

dmg:
	for i in $(DIRS) ; do ( cd $${i} ; make dmg ) ; done

clean:
	for i in $(DIRS) ; do ( cd $${i} ; make clean ) ; done

distclean:
	for i in $(DIRS) ; do ( cd $${i} ; make distclean ) ; done
