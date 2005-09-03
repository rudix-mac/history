#
# Rudix (c) 2005 Ruda Moura <ruda.moura@gmail.com>
#
# This software is licensed under GPL, see COPYING.txt
#

# Don't need to modify in most of the cases
CWD:=		$(shell pwd)
CONTENTS=	$(CWD)/contents
RESOURCES=	$(CWD)/resources
PACKAGEMAKER=	/Developer/Applications/Utilities/PackageMaker.app/Contents/MacOS/PackageMaker -build
ARCHIVER=	zip -r -0
MKDMG=		hdiutil create
TOUCH=		@date >
UNINSTALLER=	$(CONTENTS)/usr/local/sbin/uninstall-$(TITLE).sh

# make without action build and install
all: install

# About this package
about:
	@echo "$(TITLE) - $(DESCRIPTION)"

# Help me!
help:
	@echo "make <action> where action is:"
	@echo "  help		this help"
	@echo "  about		short description about the package"
	@echo "  retrive	retrive all files necessary to compile"
	@echo "  prep		explode source, apply patches, etc"
	@echo "  build		configure software and then build it"
	@echo "  install	install software into a directory"
	@echo "  package	create a package (.pkg)"
	@echo "  dmg		create a disk image (.dmg)"
	@echo "  archive	archive (zip) the package for distribution"
	@echo "  all		do retrive, prep, build, install and package together"
	@echo "  clean"
	@echo "  distclean"

# Package's meta-information
plist:
	sed "s/@TITLE@/$(TITLE)/g ; s/@NAME@/$(NAME)/g ; s/@VERSION@/$(VERSION)/g" ../../misc/Info.plist.in > Info.plist
	sed "s/@DESCRIPTION@/$(DESCRIPTION)/g ; s/@NAME@/$(NAME)/g ; s/@VERSION@/$(VERSION)/g" ../../misc/Description.plist.in > Description.plist
	$(TOUCH) plist

# DMG image
dmg: package
	$(MKDMG) -srcfolder $(TITLE).pkg ../../packages/$(TITLE)
	touch dmg

# Archive package for distribution
archive: package
	$(ARCHIVER) ../../packages/$(TITLE).pkg.zip $(TITLE).pkg
	$(TOUCH) archive

uninstaller: install
	mkdir -p $(CONTENTS)/usr/local/sbin
	echo "#!/bin/sh" > $(UNINSTALLER)
	echo "echo Uninstaller script for $(TITLE) package" >> $(UNINSTALLER)
	echo "rm -rf  /Library/Receipts/$(TITLE).pkg" >> $(UNINSTALLER)
	cd $(CONTENTS) ; \
	find . \! -type d -exec echo "rm -f {}" \; >> $(UNINSTALLER) ; \
	sed "s/^rm -f \./rm -f /" $(UNINSTALLER) > $(UNINSTALLER).new ; \
	mv $(UNINSTALLER).new $(UNINSTALLER) ; chmod +x $(UNINSTALLER)
	$(TOUCH) uninstaller

# Cleanup
dmgclean:
	rm -f dmg ../../packages/$(TITLE).dmg

archiveclean:
	rm -f archive ../../packages/$(TITLE).pkg.zip

packageclean:
	rm -rf package install plist uninstaller $(TITLE).pkg $(RESOURCES) Info.plist Description.plist
	sudo sudo rm -rf $(CONTENTS)

buildclean:
	rm -rf build prep $(TITLE)

retriveclean:
	rm -f retrive $(SOURCE)

clean: packageclean buildclean

distclean: clean archiveclean dmgclean retriveclean
