#
# Rudix (c) 2005 Ruda Moura <ruda.moura@gmail.com>
#
# This software is licensed under GPL, see COPYING.txt
#

# Don't need to modify in most of the cases
CWD:=		$(shell pwd)
PACKAGE=	$(NAME)-$(VERSION)
CONTENTS=	$(CWD)/contents
RESOURCES=	$(CWD)/resources
PACKAGEMAKER=	/Developer/Applications/Utilities/PackageMaker.app/Contents/MacOS/PackageMaker -build
ZIP=		zip -r -0
CREATEDMG=	hdiutil create
TOUCH=		@date >
UNINSTALLER=	$(CONTENTS)/usr/local/sbin/uninstall-$(PACKAGE).sh

# make without action build and install
all: install

# About this package
about:
	@echo "$(PACKAGE) - $(DESCRIPTION)"

# Help me!
help:
	@echo "make <action> where action is:"
	@echo "  help		this help"
	@echo "  about		short description about the package"
	@echo "  retrive	retrive all files necessary to compile"
	@echo "  prep		explode source, apply patches, etc"
	@echo "  build		configure software and then build it"
	@echo "  install	install software into a directory"
	@echo "  pkg	create a package (.pkg)"
	@echo "  dmg		create a disk image (.dmg)"
	@echo "  zip		zip package for distribution (.pkg.zip)"
	@echo "  all		do retrive, prep, build and install"
	@echo "  clean"
	@echo "  distclean"

retrive:
	curl -O $(URL)/$(SOURCE)
	$(TOUCH) retrive

# Package's meta-information
plist:
	sed "s/@PACKAGE@/$(PACKAGE)/g ; s/@NAME@/$(NAME)/g ; s/@VERSION@/$(VERSION)/g" ../../misc/Info.plist.in > Info.plist
	sed "s/@DESCRIPTION@/$(DESCRIPTION)/g ; s/@NAME@/$(NAME)/g ; s/@VERSION@/$(VERSION)/g" ../../misc/Description.plist.in > Description.plist
	$(TOUCH) plist

resources:
	mkdir -p $(RESOURCES)
	cp -f $(PACKAGE)/COPYING $(RESOURCES)/License.txt
	cp -f $(PACKAGE)/README $(RESOURCES)/ReadMe.txt

pkg: install plist uninstaller resources
	sudo chown -R root:wheel $(CONTENTS)
	$(PACKAGEMAKER) -p $(CWD)/$(PACKAGE).pkg -f $(CONTENTS) -r $(RESOURCES) -i Info.plist -d Description.plist
	$(TOUCH) pkg

# DMG image
dmg: pkg
	$(CREATEDMG) -srcfolder $(PACKAGE).pkg ../../packages/$(PACKAGE)
	touch dmg

# Archive package for distribution
zip: pkg
	$(ZIP) ../../packages/$(PACKAGE).pkg.zip $(PACKAGE).pkg
	$(TOUCH) zip

uninstaller: install
	mkdir -p $(CONTENTS)/usr/local/sbin
	echo "#!/bin/sh" > $(UNINSTALLER)
	echo "echo Uninstaller script for $(PACKAGE) package" >> $(UNINSTALLER)
	echo "rm -rf  /Library/Receipts/$(PACKAGE).pkg" >> $(UNINSTALLER)
	cd $(CONTENTS) ; \
	find . \! -type d -exec echo "rm -f {}" \; >> $(UNINSTALLER) ; \
	sed "s/^rm -f \./rm -f /" $(UNINSTALLER) > $(UNINSTALLER).new ; \
	mv $(UNINSTALLER).new $(UNINSTALLER) ; chmod +x $(UNINSTALLER)
	$(TOUCH) uninstaller

# Cleanup
dmgclean:
	rm -f dmg ../../packages/$(PACKAGE).dmg

zipclean:
	rm -f zip ../../packages/$(PACKAGE).pkg.zip

pkgclean:
	rm -rf pkg install plist uninstaller $(PACKAGE).pkg $(RESOURCES) Info.plist Description.plist
	sudo sudo rm -rf $(CONTENTS)

buildclean:
	rm -rf build prep $(PACKAGE)

retriveclean:
	rm -f retrive $(SOURCE)

clean: pkgclean buildclean

distclean: clean zipclean dmgclean retriveclean
