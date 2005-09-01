
			       Rudix's README.txt

		       Ruda Moura <ruda.moura@gmail.com>
				  August 2005

WHAT IS RUDIX?

Rudix for the most of users is a world class collection of pre-compiled and
ready to use Unix compatible software (packages) which are missing from
Mac OS X (or Darwin) and is very popular among Unixes environments like
GNU/Linux and FreeBSD, for example: wget, ncftp, lynx and many other
commmand line tools.

Rudix for system administrators and developers is a powerful and easy to
customize mechanism to retrive, compile and create native Mac OS X packages
(.pkg files). It is very similar in concept to BSD's ports system and is
proud to keep this tradition of simplicity and elegance.

REQUIREMENTS

DeveloperTools for Mac OS X is required to use Rudix. Of course, to compile
software it will also requires the GCC compilers kit and some libraries and
tools which already comes with DeveloperTools package. Other libraries
should be delivered with Rudix.

HOW DO I INSTALL RUDIX?

For one user usage, add the following lines to your $HOME/.profile

  PATH="$PATH:/usr/local/bin:/usr/local/sbin"
  export PATH

For system wide usage, change '/etc/profile' to
  
  PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
  export PATH

Note that end-users should install pre-compiled packages (.pkg) files.
Packages comes from Internet archived with Zip (the .zip sufix). Open Finder
and then double click on a package, like 'ccache-2.4.pkg.zip' to unzip it.
This process ends with a 'ccache-2.4.pkg' file on your current Folder. Double
click again to start the installation process of the package.

For sysadmins and developers, first and obviuous download rudix.zip, unzip it
under your $HOME folder.  Rudix does not need to compile to work, it uses
Makefiles and shell script to work.

Ports are located under '$HOME/rudix/ports'. Suppose you want to compile
'ccache' (good to save time when compiling software), just do:

  $ cd rudix/ports/ccache
  $ make

Then the following steps happens

  1. Ccache source will be retrive from Internet
  2. Source is uncompressed
  3. Build process begins
  4. Install processes begins (NOTE: this is not a system installation)
  5. Build package process begins

After a few minutes (it depends of your CPU power) a fresh package will be
available for installation, Type 'Open .' on a Terminal to call Finder and
then install the package.

FAQ

Q. Why Rudix install packages in '/usr/local'?
A. Because it is the standard place for third party software.

Q. How do I uninstall a package?
A. Mac OS X does not provides any graphical uninstaller, but you can uninstall
   Rudix's packages by running /usr/local/sbin/uninstall-<package>.sh script.
   You must run it as root (prefix the script with sudo to work).

Q. I didn't like Rudix. Is there any alternative?
A. Yes, search for DarwinPorts (very recomendable) or Fink (I don't like it).

Q. What does Rudix means? Is it a combination of your name and Unix or what?
A. Rudix stands for "software for commies" but in fact I'm not comunist ;)

COPYRIGHT AND LICENSEMENT

Rudix is copyrighted by Ruda Moura and is licensed under GPL (see COPYING.txt).
Rudix logo by Elvis Pfutzenreuter. Thank you rightwinger comrade!
