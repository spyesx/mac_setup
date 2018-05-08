#!/bin/bash


#########################################
#
# This script disables apache virtual hosts
# by deleting symlinks  in 
#
# /usr/local/etc/httpd/extra/vhost/sites-enabled
# 
# that point to vhost conf files in
# 
# /usr/local/etc/httpd/extra/vhost/sites-available
#
# 
# NOTE: The analogue of this script is
# 
# a2dissite 
#
#########################################

#
# Test for no arguments, then display the
# instructions
#
if [ $# -eq 0 ]; then
	
echo "
usage: a2dissite [config file name]

example: a2dissite 000-default.conf
  	
A symbolic link for the the virtual host 
configuration file specified in the argument 
will be deleted in the sites-enabled folder.
It won't point to the configuration file in 
the sites-available folder anymore.

The following folders must exist:
/usr/local/etc/httpd/extra/vhost/sites-available
/usr/local/etc/httpd/extra/vhost/sites-enabled
";
	exit 1;
fi

#
#
#
conf=$1;

#
# Source folder for hard vhost files
#
src="/usr/local/etc/httpd/extra/vhost/sites-available/";

#
# Source folder for symlink vhost files
#
dst="/usr/local/etc/httpd/extra/vhost/sites-enabled/";


#
# Test for necessary conf folders
#
! test -d $src && { echo "The required folder does not exist: $src"; exit 1; }
! test -d $dst && { echo "The required folder does not exist: $dst"; exit 1; }

#
# Set full path to config files
#
dest_conf_file=$dst$conf;
src_conf_file=$src$conf;


#
# Is this file already enabled
#
test -f $dest_conf_file && { echo "$conf is enabled. Let's disable it."; exit 1; }

#
# Create a symbolic link to the source config file
#

if rm $dest_conf_file; then
	
	echo "The site $conf has been disabled.";
	exit 0;
fi; 

exit 1;