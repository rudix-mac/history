#
# Rudix (c) 2005 Ruda Moura <ruda.moura@gmail.com>
#
# This software is licensed under GPL, see COPYING.txt
#

CWD:=		$(shell pwd)
PACKAGE=	$(NAME)-$(VERSION)
INSTALLDIR=	$(CWD)/$(PACKAGE)-root
CONTENTS=	$(CWD)/contents.tmp
RESOURCES=	$(CWD)/resources.tmp

PACKAGEMAKER=	/Developer/Applications/Utilities/PackageMaker.app/Contents/MacOS/PackageMaker -build
ZIP=		zip -r -0
CREATEDMG=	hdiutil create
#TOUCH=		touch
TOUCH=		@date >
#$WGET=		wget
WGET=		curl -O
UNINSTALLER=	$(CONTENTS)/usr/local/sbin/uninstall-$(PACKAGE).sh

README=		README
LICENSE=	COPYING

# Make without any action does prep, build and then install
all: install

# About this package
about:
	@echo "$(PACKAGE) - $(DESCRIPTION)"

# Help me!
help:
	@echo "make <action> where action is:"
	@echo "  help		this help"
	@echo "  about		description about the package"
	@echo "  retrive	retrive all files necessary to compile"
	@echo "  prep		explode source, apply patches, etc"
	@echo "  build		configure software and then build it"
	@echo "  install	install software into directory $(INTALLDIR)"
	@echo "  pkg		create a package (.pkg)"
	@echo "  dmg		create a disk image (.dmg)"
	@echo "  zip		zip package for distribution (.pkg.zip)"
	@echo "  all		does prep, build and then install"
	@echo "  clean"
	@echo "  distclean"
	@echo "make without any action does 'make install'"

retrive:
	$(WGET) $(URL)/$(SOURCE)
	$(TOUCH) retrive

resources:
	mkdir -p $(RESOURCES)
	cp -f $(PACKAGE)/$(LICENSE) $(RESOURCES)/License.txt
	cp -f $(PACKAGE)/$(README) $(RESOURCES)/ReadMe.txt
	sed "s/@PACKAGE@/$(PACKAGE)/g ; s/@NAME@/$(NAME)/g ; s/@VERSION@/$(VERSION)/g" ../../misc/Info.plist.in > $(RESOURCES)/Info.plist
	sed "s/@DESCRIPTION@/$(DESCRIPTION)/g ; s/@NAME@/$(NAME)/g ; s/@VERSION@/$(VERSION)/g" ../../misc/Description.plist.in > $(RESOURCES)/Description.plist
	$(TOUCH) resources

contents: install
	mkdir -p $(CONTENTS)
	rsync -av $(INSTALLDIR)/ $(CONTENTS)
	chown -R root:wheel $(CONTENTS)
	$(TOUCH) contents
	
pkg: contents resources uninstaller
	chown -R root:wheel $(CONTENTS)
	$(PACKAGEMAKER) -p $(CWD)/$(PACKAGE).pkg -f $(CONTENTS) -r $(RESOURCES) -i $(RESOURCES)/Info.plist -d $(RESOURCES)/Description.plist
	$(TOUCH) pkg

dmg: pkg
	$(CREATEDMG) -srcfolder $(PACKAGE).pkg $(PACKAGE)
	$(TOUCH) dmg

zip: pkg
	$(ZIP) $(PACKAGE).pkg.zip $(PACKAGE).pkg
	$(TOUCH) zip

uninstaller: contents
	mkdir -p $(CONTENTS)/usr/local/sbin
	echo "#!/bin/sh" > $(UNINSTALLER)
	echo "echo Running unintaller script for $(PACKAGE) package" >> $(UNINSTALLER)
	echo "rm -rf  /Library/Receipts/$(PACKAGE).pkg" >> $(UNINSTALLER)
	cd $(CONTENTS) ; \
	find . \! -type d -exec echo "rm -f {}" \; >> $(UNINSTALLER) ; \
	sed "s/^rm -f \./rm -f /" $(UNINSTALLER) > $(UNINSTALLER).new ; \
	mv $(UNINSTALLER).new $(UNINSTALLER) ; chmod +x $(UNINSTALLER)
	$(TOUCH) uninstaller

dmgclean:
	rm -f dmg $(PACKAGE).dmg

zipclean:
	rm -f zip $(PACKAGE).pkg.zip

pkgclean:
	rm -rf contents resources uninstaller pkg $(PACKAGE).pkg $(CONTENTS) $(RESOURCES)

installclean:
	rm -rf install $(INSTALLDIR)

buildclean:
	rm -rf prep build $(PACKAGE)

retriveclean:
	rm -f retrive $(SOURCE)

clean: installclean buildclean

distclean: clean zipclean dmgclean retriveclean pkgclean
