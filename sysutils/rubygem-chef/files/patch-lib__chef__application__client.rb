--- ./lib/chef/application/client.rb.orig	2014-03-31 13:01:34.000000000 +0900
+++ ./lib/chef/application/client.rb	2014-03-31 13:00:10.000000000 +0900
@@ -262,7 +262,7 @@
         require 'chef/knife'
         config[:config_file] = Chef::Knife.locate_config_file
       else
-        config[:config_file] = Chef::Config.platform_specific_path("/etc/chef/client.rb")
+        config[:config_file] = Chef::Config.platform_specific_path("%%PREFIX%%/etc/chef/client.rb")
       end
     end
     super
