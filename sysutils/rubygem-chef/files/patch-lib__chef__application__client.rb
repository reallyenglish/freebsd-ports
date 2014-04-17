--- ./lib/chef/application/client.rb.orig	2014-04-17 16:53:49.000000000 +0900
+++ ./lib/chef/application/client.rb	2014-04-17 16:53:53.000000000 +0900
@@ -269,7 +269,7 @@
         require 'chef/knife'
         config[:config_file] = Chef::Knife.locate_config_file
       else
-        config[:config_file] = Chef::Config.platform_specific_path("/etc/chef/client.rb")
+        config[:config_file] = Chef::Config.platform_specific_path("%%PREFIX%%/etc/chef/client.rb")
       end
     end
     super
