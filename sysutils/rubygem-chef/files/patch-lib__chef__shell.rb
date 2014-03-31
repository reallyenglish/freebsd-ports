--- ./lib/chef/shell.rb.orig	2014-03-31 13:04:57.000000000 +0900
+++ ./lib/chef/shell.rb	2014-03-31 13:05:43.000000000 +0900
@@ -194,7 +194,7 @@
 When no CONFIG is specified, chef-shell attempts to load a default configuration file:
 * If a NAMED_CONF is given, chef-shell will load ~/.chef/NAMED_CONF/chef_shell.rb
 * If no NAMED_CONF is given chef-shell will load ~/.chef/chef_shell.rb if it exists
-* chef-shell falls back to loading /etc/chef/client.rb or /etc/chef/solo.rb if -z or
+* chef-shell falls back to loading %%PREFIX%%/etc/chef/client.rb or %%PREFIX%%/etc/chef/solo.rb if -z or
   -s options are given and no chef_shell.rb can be found.
 FOOTER
 
@@ -300,9 +300,9 @@
       elsif ENV['HOME'] && ::File.exist?(File.join(ENV['HOME'], '.chef', 'chef_shell.rb'))
         File.join(ENV['HOME'], '.chef', 'chef_shell.rb')
       elsif config[:solo]
-        "/etc/chef/solo.rb"
+        "%%PREFIX%%/etc/chef/solo.rb"
       elsif config[:client]
-        "/etc/chef/client.rb"
+        "%%PREFIX%%/etc/chef/client.rb"
       else
         nil
       end
