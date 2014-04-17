--- ./lib/chef/application/solo.rb.orig	2014-04-17 16:53:49.000000000 +0900
+++ ./lib/chef/application/solo.rb	2014-04-17 16:53:53.000000000 +0900
@@ -31,7 +31,7 @@
   option :config_file,
     :short => "-c CONFIG",
     :long  => "--config CONFIG",
-    :default => Chef::Config.platform_specific_path('/etc/chef/solo.rb'),
+    :default => Chef::Config.platform_specific_path('%%PREFIX%%/etc/chef/solo.rb'),
     :description => "The configuration file to use"
 
   option :formatter,
